class SessionsController < ApplicationController



  def new_patient
    @patient = Patient.new
  end


  def new_physician
    @physician = Physician.new
  end




  def create_patient
    @patient = Patient.find_by(name: params[:name])
    if @patient && @patient.authenticate(params[:patient][:password])
      session[:patient_id] = @patient.id
      flash[:notice] = "Successfully created a Patient"
      redirect_to patient_path(@patient)
    else
      render 'sessions/new_patient'
    end
  end


  def create_physician
    @physician = Physician.find_by(name: params[:name])
    if @physician && @physician.authenticate(params[:physician][:password])
      sessions[:physician_id] = @physician.id
      flash[:notice] = "Successfully created a Physician"
      redirect_to physician_path(@physician)
    else
      render 'sessions/new_physician'
    end
  end





  def destroy
    session.clear
    flash[:notice] = "You have been Successfully Logged Out"
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end




end
