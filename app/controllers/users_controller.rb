# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update delete destroy]
  helper_method :current_user_is_admin?

  # GET /users or /users.json
  def index
    @sort_by = params[:sort_by] || 'name'
    @sort_direction = params[:sort_direction] || 'asc'

    if params[:search].present?
      search_term = params[:search].downcase
      @users = case params[:filter]
               when 'name'
                 User.where(
                   "LOWER(CONCAT(\"First_Name\", ' ', \"Last_Name\")) LIKE :search OR
           LOWER(CONCAT(\"First_Name\", ' ', \"Middle_Name\")) LIKE :search OR
           LOWER(\"First_Name\") LIKE :search OR
           LOWER(\"Last_Name\") LIKE :search OR
           LOWER(\"Middle_Name\") LIKE :search",
                   search: "%#{search_term}%"
                 )
               when 'current_job'
                 User.where('LOWER("Current_Job") LIKE ?', "%#{search_term}%")
               when 'location'
                 User.joins(:location).where(
                   'LOWER(locations.city) LIKE :search OR LOWER(locations.state) LIKE :search OR LOWER(locations.country) LIKE :search',
                   search: "%#{search_term}%"
                 )
                when 'class_year'
                  search_year = search_term.to_i
                  @users = User.joins(:education_infos)
                               .select("users.*, MIN(ABS(education_infos.\"Grad_Year\" - #{search_year})) AS year_diff")
                               .group("users.id")
                               .order("year_diff")
               when 'practice_area'
                 User.joins(:practice_areas).where('LOWER(practice_areas.practice_area) LIKE ?', "%#{search_term}%")
               else
                 User.where(
                   "LOWER(CONCAT(\"First_Name\", ' ', \"Last_Name\")) LIKE :search OR
           LOWER(CONCAT(\"First_Name\", ' ', \"Middle_Name\")) LIKE :search OR
           LOWER(\"First_Name\") LIKE :search OR
           LOWER(\"Last_Name\") LIKE :search OR
           LOWER(\"Middle_Name\") LIKE :search",
                   search: "%#{search_term}%"
                 )
               end
    else
      @users = User.all
    end

    case @sort_by
    when 'name'
      @users = @users.order("\"First_Name\" #{@sort_direction}, \"Last_Name\" #{@sort_direction}")
    when 'current_job'
      @users = @users.order("\"Current_Job\" #{@sort_direction}")

    when 'practice_areas'
      @users = @users.left_joins(:practice_areas)
                     .group(:id)
                     .order(Arel.sql("string_agg(practice_areas.practice_area, ', ') #{@sort_direction}"))
    end
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if params[:user][:location_id].blank? && params[:user][:location_attributes].present?
      # Build a new location for the user
      @user.build_location(user_params[:location_attributes])
    end

    @user.Email = session[:email]
    respond_to do |format|
      if @user.save
        save_practice_areas
        save_firm_type
        format.html { redirect_to(user_url(@user), notice: 'User was successfully created.') }
        format.json { render(:show, status: :created, location: @user) }

      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @user.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.Email == session[:email] || current_user_is_admin?
        if @user.update(user_params)
          save_practice_areas
          save_firm_type
          format.html { redirect_to(@user, notice: 'Profile was successfully updated.') }
          format.json { render(:show, status: :ok, location: @user) }
        else
          format.html { render(:edit) }
          format.json { render(json: @user.errors, status: :unprocessable_entity) }
        end
      else
        format.html { redirect_to(@user, alert: 'You can only update your own profile.') }
        format.json { render(json: { error: 'Unauthorized' }, status: :unauthorized) }
      end
    end
  end

  # GET /users/1/delete
  def delete
    redirect_to(@user, alert: 'You can only delete your own profile.') if @user.Email != session[:email] && !current_user_is_admin?
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if @user.Email == session[:email] || current_user_is_admin?
      @user.destroy!
      respond_to do |format|
        format.html { redirect_to(users_url, notice: 'User was successfully destroyed.') }
        format.json { head(:no_content) }
      end
    else
      respond_to do |format|
        format.html { redirect_to(@user, alert: 'You can only delete your own profile.') }
        format.json { render(json: { error: 'Unauthorized' }, status: :unauthorized) }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    if params[:id].present?
      @user = User.find_by(id: params[:id])
      redirect_to(new_user_path) if @user.nil?
    else
      @user = User.new
    end
  end

  # Only allow a list of trusted parameters through.
  def user_params
    permitted_params = params.require(:user).permit(:First_Name, :Last_Name, :Middle_Name, :Profile_Picture, :Email, :Phone_Number, :Current_Job,
                                                    :Linkedin_Profile, :is_Admin, { location_attributes: %i[country state city] },
                                                    :firm_type_id, practice_area_ids: []
    )
    permitted_params[:is_Admin] = false if permitted_params[:is_Admin] == 'false'
    permitted_params
  end

  # Only allow a list of trusted parameters through.
  def location_params
    params.require(:location).permit(:country, :state, :city)
  end

  def save_practice_areas
    @user.area_joins.clear # Clear existing associations
    practice_area_ids = params[:user][:practice_area_ids].reject(&:blank?) # Ensure no blank IDs
    practice_area_ids.each do |id|
      practice_area = PracticeArea.find(id)
      @user.practice_areas << practice_area if practice_area.present?
    end
  end

  def save_firm_type
    if params[:user][:firm_type_id].present?
      firm_type_id = params[:user][:firm_type_id]
      firm_type = FirmType.find(firm_type_id)
      @user.firm_type = firm_type if firm_type.present?
    end
  end

  def current_user_is_admin?
    logged_in_user = User.find_by(Email: session[:email])
    logged_in_user&.is_Admin
  end
end

# Walk classmate through for help
# Could be used for auto pop of form in user profile
# class UsersController < ApplicationController
#   def create
#     @user = User.new(user_params)
#     # Set the user's location based on their IP address
#     @user.set_location_by_ip(request.remote_ip)

#     if @user.save
#       # Redirect or render success response
#       redirect_to @user, notice: 'User was successfully created.'
#     else
#       # Handle errors, render form again
#       render :new
#     end
#   end

#   # Assuming you also want to update location on profile update
#   def update
#     @user = User.find(params[:id])
#     @user.assign_attributes(user_params)
#     @user.set_location_by_ip(request.remote_ip) if params[:user][:location].blank?

#     if @user.save
#       redirect_to @user, notice: 'User was successfully updated.'
#     else
#       render :edit
#     end
#   end

#   private

#   def user_params
#     params.require(:user).permit(:name, :email, :password, :password_confirmation, :location) # Add other fields as necessary
#   end
# end
