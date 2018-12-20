class SessionsController < ApplicationController



  def new
    @patient = Patient.new
    @physician = Physician.new
  end




  def create
    patient = Patient.find_by(name: params[:name])
    if patient && patient.authenticate(params[:password])
      session[:patient.id] = patient.id
      redirect_to patient_path(patient)
    elsif
      physician = Physician.find_by(name: params[:name])
      if physician && physician.authenticate(params[:password])
        sessions[:physician.id] = physician.id
        redirect_to physician_path(physician)
      else
        render 'session/new'
      end
    end
  end



    def destroy
     reset_session
     redirect_to root_path
    end



  end
