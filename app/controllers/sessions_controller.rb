
class SessionsController < ApplicationController



  def new
    if logged_in?
      if @current_physician
        redirect_to physician_path(@current_physician)
      elsif @current_patient
        redirect_to patient_path(@current_patient)
      end
    end
  end



    def create
      if params[:session]
        if params[:session][:name].present? && params[:session][:password].present?
          physician = Physician.find_by(:name => params[:session][:name])
          patient = Patient.find_by(:name => params[:session][:name])
          if physician && physician.authenticate(params[:session][:password])
            login_doctor(physician)
            redirect_to physician_path(physician)
          elsif patient && patient.authenticate(params[:session][:password])
            login_patient(patient)
            redirect_to patient_path(patient)
          else
            flash[:notice] = "No account found with that email/password combination. Try again."
            render :new
          end
        end
      elsif request.env['omniauth.auth'].present?
        physician = Physician.login_with_omniauth(request.env["omniauth.auth"])
         login_physician(physician)
        redirect_to edit_physician_path(physician)
      end
    end


  # def create_patient
  #   @patient = Patient.find_by(name: params[:name])
  #   if @patient && @patient.authenticate(params[:password])
  #     session[:patient_id] = @patient.id
  #     flash[:notice] = "Successfully created a Patient"
  #     redirect_to patient_path(@patient)
  #   else
  #     render 'sessions/new_patient'
  #   end
  # end
  #
  #
  # def create_physician
  #   @physician = Physician.find_by(name: params[:name])
  #   if @physician && @physician.authenticate(params[:password])
  #     session[:physician_id] = @physician.id
  #     flash[:notice] = "Successfully created a Physician"
  #     redirect_to root_path
  #   else
  #     render 'sessions/new_physician'
  #   end
  # end
  #
  #
  # def create_physician_fb
  #  @physician = Physician.find_or_create_by(auth)
  #   session[:physician_id] = @physician.id
  #   flash[:notice] = "Successfully logged in with Facebook"
  #   redirect_to physician_path(@physician)
  # else
  #   redirect_to physician_signin_path
  # end





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
