# frozen_string_literal: true

class UniversitiesController < ApplicationController
  before_action :set_university, only: %i[show edit update destroy]
  helper_method :current_user_is_admin?

  # GET /universities or /universities.json
  def index
    @universities = University.all
  end

  # GET /universities/1 or /universities/1.json
  def show; end

  # GET /universities/new
  def new
    @university = University.new
  end

  # GET /universities/1/edit
  def edit
    redirect_to(@university, alert: 'Only admins can update universities.') unless current_user_is_admin?
  end

  # POST /universities or /universities.json
  def create
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.html { redirect_to(university_url(@university), notice: 'University was successfully created.') }
        format.json { render(:show, status: :created, location: @university) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @university.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /universities/1 or /universities/1.json
  def update
    if current_user_is_admin?
      respond_to do |format|
        if @university.update(university_params)
          format.html { redirect_to(university_url(@university), notice: 'University was successfully updated.') }
          format.json { render(:show, status: :ok, location: @university) }
        else
          format.html { render(:edit, status: :unprocessable_entity) }
          format.json { render(json: @university.errors, status: :unprocessable_entity) }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to(universities_url(@university), notice: 'Only admins can update universities.') }
        format.json { render(json: { error: 'Unauthorized' }, status: :unauthorized) }
      end
    end
  end

  # DELETE /universities/1 or /universities/1.json
  def destroy
    if current_user_is_admin?
      @university.destroy!

      respond_to do |format|
        format.html { redirect_to(universities_url, notice: 'University was successfully destroyed.') }
        format.json { head(:no_content) }
      end
    else
      respond_to do |format|
        format.html { redirect_to(university_url(@university), notice: 'Only admins can delete universities.') }
        format.json { render(json: { error: 'Unauthorized' }, status: :unauthorized) }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_university
    @university = University.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def university_params
    params.require(:university).permit(:University)
  end

  def current_user_is_admin?
    logged_in_user = User.find_by(Email: session[:email])
    logged_in_user&.is_Admin
  end

end
