# frozen_string_literal: true

class EducationInfosController < ApplicationController
  before_action :set_education_info, only: %i[show edit update destroy]
  before_action :set_current_user

  # GET /education_infos or /education_infos.json
  def index
    @education_infos = EducationInfo.all
  end

  # GET /education_infos/1 or /education_infos/1.json
  def show; end

  # GET /education_infos/new
  def new
    @education_info = EducationInfo.new
  end

  # GET /education_infos/1/edit
  def edit
    redirect_to(@education_info, alert: "You may only edit education infos you own") if @education_info.user.Email != session[:email]
  end

  # POST /education_infos or /education_infos.json
  def create
    @education_info = EducationInfo.new(education_info_params)
    @education_info.user_id = @user.id

    respond_to do |format|
      if @education_info.save
        format.html { redirect_to(education_info_url(@education_info), notice: 'Education info was successfully created.') }
        format.json { render(:show, status: :created, location: @education_info) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @education_info.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /education_infos/1 or /education_infos/1.json
  def update
    redirect_to(@education_info, alert: "You may only edit education infos you own") if @education_info.user.Email != session[:email]

    respond_to do |format|
      if @education_info.update(education_info_params)
        format.html { redirect_to(education_info_url(@education_info), notice: 'Education info was successfully updated.') }
        format.json { render(:show, status: :ok, location: @education_info) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @education_info.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /education_infos/1 or /education_infos/1.json
  def destroy
    redirect_to(@education_info, alert: "You may only delete education infos you own") if @education_info.user.Email != session[:email]

    @education_info.destroy!

    respond_to do |format|
      format.html { redirect_to(education_infos_url, notice: 'Education info was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_education_info
    @education_info = EducationInfo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def education_info_params
    params.require(:education_info).permit(:Semester, :Grad_Year, :university_id, :Degree_Type)
  end

  def set_current_user
    @user = User.find_by_Email(current_admin.email)
    puts @user.inspect
  end
end
