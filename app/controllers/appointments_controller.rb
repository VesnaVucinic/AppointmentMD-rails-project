class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def index
    @appointments = Appointment.all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment
      @appointment.save
      flash[:notice] = "Successfully Created a new Appointment"
      redirect_to appointment_path(@appointment)
    else
      render 'appointments/new'
    end
  end

  def update
    @appointment.update(appointment_params)
    if @appointment.save
      flash[:notice] = "Successfully updated Appointment"
      redirect_to appointment_path(@appointment)
    else
      flash[:notice] = "There was an Error Updating Appointment Info"
      redirect_to appointment_path(@appointment)
    end
  end



  def destroy
  end


  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, [:appointment][:physician], [:appointment][:patient], [:appointment][:location])
  end

end
