class SessionsController < ApplicationController



  def new
    if session[:patient_id]
      redirect_to patient_path(:session_id)
    elsif session[:physician_id]
      redirect_to session[:physician_id]
    else
      @patient = Patient.new
      @physician = Physician.new
    end
  end




  def create
    @patient = Patient.find_by(name: params[:name])
    if @patient && @patient.authenticate(params[:password])
      session[:patient_id] = @patient.id
      flash[:notice] = "Successfully created a Patient"
      redirect_to patient_path(@patient)
    elsif
      @physician = Physician.find_by(name: params[:name])
      if @physician && @physician.authenticate(params[:password])
        sessions[:physician_id] = @physician.id
        flash[:notice] = "Successfully created a Physician"
        redirect_to physician_path(@physician)
      else
        render 'session/new'
      end
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
