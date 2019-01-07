class PatientsController < ApplicationController
  before_action :login_required, except: [:new, :create]
  before_action :find_patient, except: [:new, :create]


  def index
    @patients = Patient.all
  end


  def show
    if @current_patient = @patient
      @appointments = Appointment.where("patient_id = ?", @current_patient.id)
    else
      if @current_physician
        redirect_to physician_path(@physician)
      elsif @current_patient
        redirect_to patient_path(@current_patient)
      else redirect_to root_path
      end
    end
  end



  def new
   if @current_physician
     redirect_to physician_path(@physician)
   elsif @current_patient
     redirect_to patient_path(@patient)
   end
   @patient = Patient.new
  end



  def edit
   if @current_patient
     unless current_patient == @patient
       redirect_to patient_path(@current_patient)
     end
   elsif @current_physician
     redirect_to physician_path(@current_physician)
   else
     redirect_to root_path
   end
 end



  def create
      @patient = Patient.new(patient_params)
      if @current_patient
        flash[:notice] = "You already have an account."
        redirect_to patient_path(@current_patient)
      elsif @current_physician
        flash[:notice] = "You can't create a patient account."
        redirect_to patient_path(@patient)
      end
      if @patient.save
        login_patient(@patient)
        flash[:notice] = "You have successfully signed up."
        redirect_to patient_path(@patient)
      else
        flash[:notice] = "Signup failed. Doctor account couldn't be created."
        render :new
      end
    end





    def update
        if @current_patient
          if @current_patient == @patient
            if @patient.update(patient_params)
              flash[:notice] = "Patient details were successfully updated."
              redirect_to patient_path(@patient)
            else
              flash[:notice] = "Patient update failed. Fix the fields indicated by the error messages and try again."
              render :new
            end
          else
            flash[:notice] = "You can't edit another Patients details."
          end
        else
          flash[:notice] = "You can't edit a Patients details."
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
