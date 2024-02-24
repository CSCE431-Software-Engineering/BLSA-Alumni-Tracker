class FirmTypesController < ApplicationController
  before_action :set_firm_type, only: %i[ show edit update destroy ]

  # GET /firm_types or /firm_types.json
  def index
    @firm_types = FirmType.all
  end

  # GET /firm_types/1 or /firm_types/1.json
  def show
  end

  # GET /firm_types/new
  def new
    @firm_type = FirmType.new
  end

  # GET /firm_types/1/edit
  def edit
  end

  # POST /firm_types or /firm_types.json
  def create
    @firm_type = FirmType.new(firm_type_params)

    respond_to do |format|
      if @firm_type.save
        format.html { redirect_to firm_type_url(@firm_type), notice: "Firm type was successfully created." }
        format.json { render :show, status: :created, location: @firm_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @firm_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /firm_types/1 or /firm_types/1.json
  def update
    respond_to do |format|
      if @firm_type.update(firm_type_params)
        format.html { redirect_to firm_type_url(@firm_type), notice: "Firm type was successfully updated." }
        format.json { render :show, status: :ok, location: @firm_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @firm_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firm_types/1 or /firm_types/1.json
  def destroy
    @firm_type.destroy

    respond_to do |format|
      format.html { redirect_to firm_types_url, notice: "Firm type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_firm_type
      @firm_type = FirmType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def firm_type_params
      params.require(:firm_type).permit(:firm_type)
    end
end
