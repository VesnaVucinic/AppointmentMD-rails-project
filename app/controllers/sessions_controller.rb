class SessionsController < ApplicationController



  def new
      @patient = Patient.new
      @physician = Physician.new
  end




  def create
    @patient = Patient.find_by(name: params[:name])
    if @patient && @patient.authenticate(params[:patient][:password])
      session[:user_id] = @patient.id
      flash[:notice] = "Successfully created a Patient"
      redirect_to patient_path(@patient)
    elsif
      @physician = Physician.find_by(name: params[:name])
      if @physician && @physician.authenticate(params[:physician][:password])
        sessions[:user_id] = @physician.id
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
