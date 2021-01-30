class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment= Appointment.find(params[id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
  end

  def edit
    @appointment= Appointment.find(params:[id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to @appointment
    else
      render : edit
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
  end
    
  private
  
  def appointment_params
    params.require(:appointment).permit(:datetime, :doctor_id, :patient_id)
  end
  
end
