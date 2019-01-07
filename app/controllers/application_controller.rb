class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login_physician(physician)
    session[:physician_id] = physician.id
  end



  def login_patient(pateint)
    session[:patient_id] = patient.id
  end

  def login_required
    if !logged_in?
      redirect_to sign_path
    end
  end


  def logged_in?
    if !current_physician.nil?
      !!current_physician
    elsif !current_patient.ni?
      !!current_patient 
    else
      false
    end
  end
  helper_method :logged_in?


  def current_physician
    @current_physician ||= Physician.find(session[:physician_id]) if session[:physician_id].present?
  end
  helper_method :current_physician

  def current_patient
    @current_patient ||= Patient.find(session[:patient_id]) if session[:patient_id].present?
  end
  helper_method :current_patient







end
