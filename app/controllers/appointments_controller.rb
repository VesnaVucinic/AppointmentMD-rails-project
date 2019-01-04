class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update]


  def index
    @appointments = Appointment.all
  end

  def show
  end


  def new
    @appointment = Appointment.new
  end

  def edit
  end


  def create
    @appointment = Appointment.new(appointment_params)
      if  @appointment.save
      flash[:notice] = "Successfully Created a new Appointment"
      redirect_to appointment_path(@appointment)
    else
      render 'appointments/new'
    end
  end

  def update
     if @appointment.update(appointment_params)
      flash[:notice] = "Successfully updated Appointment"
      redirect_to appointment_path(@appointment)
    else
      flash[:notice] = "There was an Error Updating Appointment Info"
      redirect_to edit_appointment_path(@appointment)
    end
  end




  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :physician_id, :patient_id, :location_id)
  end


  def find_appointment
    @appointment = Appointment.find_by(id: params[:id])
  end

end
