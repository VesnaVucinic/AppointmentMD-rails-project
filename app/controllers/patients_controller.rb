class PatientsController < ApplicationController
  before_action :find_patient, only: [:show, :edit, :update]


  def index
    @patients = Patient.all
  end


  def show
    @appointments = Appointment.all
  end



  def new
    @patient = Patient.new
  end



  def edit
    find_patient
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




  def update
  if @patient.update(patient_params)
      flash[:notice] = "Successfully Updated Patient"
      redirect_to patient_path(@patient)
    else
      flash[:notice] = "There was an Error Updating Patient Info"
      redirect_to edit_patient_path(@pateint)
    end
  end



  private

  def patient_params
    params.require(:patient).permit(:name, :age, :height, :date_of_birth, :password)
  end

  def find_patient
    @patient = Patient.find_by(id: params[:id])
  end


end
