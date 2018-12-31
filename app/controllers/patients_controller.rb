class PatientsController < ApplicationController


  def new
    @patient = Patient.new
  end


  def index
    @patients = Patient.all
  end


  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:notice] = "Successfully created a new Patient"
      session[:patient_id] = @patient.id
      redirect_to patient_path(@patient)
    else
      flash[:notice] = "There was an error creating a new Patient"
      render 'patients/new'
    end
  end

  def show
   find_patient
  end

  def edit
    find_patient
  end


  def update
    find_patient
    @patient.update(patient_params)
    if @patient.save
      flash[:notice] = "Successfully Updated Patient"
      redirect_to patient_path
    else
      flash[:notice] = "There was an Error Updating Patient Info"
      redirect_to edit_patient_path
    end
  end

  def destroy
    find_patient
    @patient.destroy
    redirect_to root_path
  end


  private

  def patient_params
    params.require(:patient).permit(:name, :age, :height, :date_of_birth, :password)
  end

  def find_patient
    @patient = Patient.find_by(id: params[:id])
  end


end
