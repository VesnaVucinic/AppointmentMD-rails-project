class SessionsController < ApplicationController



  def new
    @patient = Patient.new
    @physician = Physician.new
  end




  def create
    @patient = Patient.find_by(name: params[:name])
    if @patient && @patient.authenticate(params[:password])
      session[:patient.id] = @patient.id
      flash[:notice] = "Successfully created a Patient"
      redirect_to patient_path(@patient)
    elsif
      @physician = Physician.find_by(name: params[:name])
      if @physician && @physician.authenticate(params[:password])
        sessions[:physician.id] = @physician.id
        flash[:notice] = "Successfully created a Physician"
        redirect_to physician_path(@physician)
      else
        render 'session/new'
      end
    end
  end


  def create_form_omniauth
    if @patient = Patient.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.password = auth['info']['password']
      u.image = auth['info']['image']
    end
    session[:patient.id] = @patient.id
    flash[:notice] = "Successfully created a Patient"
    render 'welcome/home'
  elsif
    @physician = Physician.find_or_create_by(uid: auth['uid']) do |u|
      u.name - auth['info']['name']
      u.password = auth['info']['password']
      u.image = auth['info']['image']
    end
    session[:physician.id] = @physician.id
    flash[:notice] = "Successfully created a Physician"
    render 'welcome/home'
  end
end



    def destroy
     reset_session
     flash[:notice] = "You have been Successfully Logged Out"
     redirect_to root_path
    end



  end
