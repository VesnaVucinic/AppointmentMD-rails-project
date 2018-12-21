class AppointmentsController < ApplicationController
  def new
    @appointments = Appointment.new
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
  end

  def index
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment
      @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render 'appointments/new'
    end
  end


  def destroy
  end


  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, [:appointment][:physician], [:appointment][:patient], [:appointment][:location])
  end

end
