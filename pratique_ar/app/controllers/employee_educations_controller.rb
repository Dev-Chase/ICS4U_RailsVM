class EmployeeEducationsController < ApplicationController
  before_action :set_employee_education, only: %i[ show edit update destroy ]

  # GET /employee_educations or /employee_educations.json
  def index
    @employee_educations = EmployeeEducation.all
  end

  # GET /employee_educations/1 or /employee_educations/1.json
  def show
  end

  # GET /employee_educations/new
  def new
    @employee_education = EmployeeEducation.new
  end

  # GET /employee_educations/1/edit
  def edit
  end

  # POST /employee_educations or /employee_educations.json
  def create
    @employee_education = EmployeeEducation.new(employee_education_params)

    respond_to do |format|
      if @employee_education.save
        format.html { redirect_to employee_education_url(@employee_education), notice: "Employee education was successfully created." }
        format.json { render :show, status: :created, location: @employee_education }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee_education.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_educations/1 or /employee_educations/1.json
  def update
    respond_to do |format|
      if @employee_education.update(employee_education_params)
        format.html { redirect_to employee_education_url(@employee_education), notice: "Employee education was successfully updated." }
        format.json { render :show, status: :ok, location: @employee_education }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee_education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_educations/1 or /employee_educations/1.json
  def destroy
    @employee_education.destroy

    respond_to do |format|
      format.html { redirect_to employee_educations_url, notice: "Employee education was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_education
      @employee_education = EmployeeEducation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_education_params
      params.require(:employee_education).permit(:institution, :degree, :date_obtained, :completed, :employee_id)
    end
end
