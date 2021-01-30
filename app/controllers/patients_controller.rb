class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
  end

  def edit
    @patient = Patient.find(params:[id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render : edit
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
  end
    
  private
  
  def patient_params
    params.require(:patient).permit(:firstname,:lastname,:phone)
  end
  
end
