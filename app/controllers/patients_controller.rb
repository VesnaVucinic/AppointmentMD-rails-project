class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def show
    if session[:user.id]
      @patient = Patient.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient
      @patient.save
      session[:patient.id] = @patient .id
      redirect_to patient_path(@patient)
    else
      render 'patients/new'
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :age, :height, :date_of_birth, :password)
  end


end
