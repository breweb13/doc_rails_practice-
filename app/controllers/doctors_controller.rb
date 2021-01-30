class DoctorsController < ApplicationController
  
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end
  
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])

    if @doctor.update(doctor_params)
      redirect_to @doctor
    else
      render :edit
    end

  end

  def destroy
    @doctor = Doctor.find(parans[:id])
    @doctor.destroy
  end
  
  private
  
  def doctor_params
    params.require(:doctor).permit(:name)
  end

end
