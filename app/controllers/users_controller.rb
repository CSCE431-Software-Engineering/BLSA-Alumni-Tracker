# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :delete, :destroy]

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

    @user.Email = session[:email]
    respond_to do |format|
      if @user.save
        save_practice_areas 
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

      if @user.Email == session[:email]
        if @user.update(user_params)
          save_practice_areas
          format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to @user, alert: 'You can only update your own profile.' }
        format.json { render json: { error: 'Unauthorized' }, status: :unauthorized }
      end
    end
  end

  # GET /users/1/delete
  def delete
    if @user.Email != session[:email]
      redirect_to @user, alert: 'You can only delete your own profile.'
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if @user.Email == session[:email]
      @user.destroy!
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @user, alert: 'You can only delete your own profile.' }
        format.json { render json: { error: 'Unauthorized' }, status: :unauthorized }
      end
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
                                                    :Location, :Linkedin_Profile, :is_Admin, practice_area_ids: []

    )
    permitted_params[:is_Admin] = false if permitted_params[:is_Admin] == 'false'
    permitted_params
  end
  
  def save_practice_areas
    @user.area_joins.clear # Clear existing associations
    practice_area_ids = params[:user][:practice_area_ids].reject(&:blank?) # Ensure no blank IDs
    practice_area_ids.each do |id|
      practice_area = PracticeArea.find(id)
      @user.practice_areas << practice_area if practice_area.present?
    end
  end

end
