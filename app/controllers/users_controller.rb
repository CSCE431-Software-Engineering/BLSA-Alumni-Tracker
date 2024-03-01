# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @users = User.all
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

    respond_to do |format|
      if @user.save
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
      if @user.update(user_params)
        format.html { redirect_to(user_url(@user), notice: 'User was successfully updated.') }
        format.json { render(:show, status: :ok, location: @user) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @user.errors, status: :unprocessable_entity) }
      end
    end
  end

  # GET /users/1/delete
  def delete
    @user = User.find(params[:id])
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to(users_url, notice: 'User was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    permitted_params = params.require(:user).permit(:First_Name, :Last_Name, :Middle_Name, :Profile_Picture, :Email, :Phone_Number, :Current_Job,
                                                    :Location, :Linkedin_Profile, :is_Admin
    )
    permitted_params[:is_Admin] = false if permitted_params[:is_Admin] == 'false'
    permitted_params
  end

end

#Walk classmate through for help
class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    # Set the user's location based on their IP address
    @user.set_location_by_ip(request.remote_ip)

    if @user.save
      # Redirect or render success response
      redirect_to @user, notice: 'User was successfully created.'
    else
      # Handle errors, render form again
      render :new
    end
  end

  # Assuming you also want to update location on profile update
  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    @user.set_location_by_ip(request.remote_ip) if params[:user][:location].blank?

    if @user.save
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :location) # Add other fields as necessary
  end
end
