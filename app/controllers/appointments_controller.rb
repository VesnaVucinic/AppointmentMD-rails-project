class AppointmentsController < ApplicationController


# get /appointments
  def index
    @appointments = Appointment.all
  end


# get /appointments/appointment.id
  def show
    @appointment = Appointment.find(params[:id])
    @patient = Patient.find(params[:id])
    @physician = Physician.find(params[:id])
  end

# get /appointments/new
  def new
    @appointment = Appointment.new
  end


# get /appointments/appointment.id/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end



#post /appointments
  def create
    @appointment = Appointment.new(appointment_params)
      if  @appointment.save
      flash[:notice] = "Successfully Created a new Appointment"
      redirect_to @appointment
    else
      render 'appointments/new'
    end
  end


#put /appointments/appointment.id
  def update
    @appointment = Appointment.find(params[:id])
     if @appointment.update(appointment_params)
      flash[:notice] = "Successfully updated Appointment"
      redirect_to @appointment
    else
      flash[:notice] = "There was an Error Updating Appointment Info"
      render edit_appointment_path(@appointment)
    end
  end



  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :physician_id, :patient_id, :location_id)
  end


  def find_appointment
    @appointment = Appointment.find_by(id: params[:id])
  end

  def find_physician
    @physician = Physician.find_by(id: params[:id])
  end


  def find_patient
    @patient = Patient.find_by(id: params[:id])
  end

end
