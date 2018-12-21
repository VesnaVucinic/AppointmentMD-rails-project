class PatientsController < ApplicationController


  def new
    @patient = Patient.new
  end


  def index
    @patients = Patient.all
  end


  def create
    @patient = Patient.new(patient_params)

    if @patient
      @patient.save
      flash[:notice] = "Successfully created a new Patient"
      session[:patient_id] = @patient.id
      redirect_to patient_path(@patient)
    else
      flash[:notice] = "There was an error creating a new Patient"
      render 'patients/new'
    end
  end

  def show
    if session[:patient_id]
      @patient = Patient.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end


  def update
    @patient = Patient.find_by(id: params[:id])
    @patient.update(patient_params)
    if @patient.save
      flash[:notice] = "Successfully Updated Patient"
      redirect_to patient_path(@patient)
    else
      flash[:notice] = "There was an Error Updating Patient Info"
      redirect_to patient_path(@patient)
    end 
  end


  private

  def patient_params
    params.require(:patient).permit(:name, :age, :height, :date_of_birth, :password)
  end


end
