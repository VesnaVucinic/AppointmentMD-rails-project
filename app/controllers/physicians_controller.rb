class PhysiciansController < ApplicationController
  before_action :logged_in, except: [:index, :show, :new, :create]
  before_action :find_physician, except: [:index, :new, :create]



 def index
   @physicians = Physician.all
 end


 def show
  if @physician
    @appointment = Appointment.where("physician_id = ?", @physician.id)
  else
    @appointments = nil
  end
 end



 def new
   if @current_physician
     redirect_to physician_path(@physician)
   elsif @current_patient
   redirect_to patient_path(@patient)
 end
 @physician = Physician.new
 end



 def edit
   if @current_physician
     unless @current_physician == @physician
       redirect_to physician_path(@current_physician)
     end
   elsif @current_patient
     redirect_to patient_path(@current_patient)
   else
     redirect_to root_path
   end
 end



  def create
    @physician = Physician.new(physician_params)
    if @current_physician
      flash[:notice] = "You have previously Signed Up"
      redirect_to physician_path(@physician)
    elsif @current_patient
      flash[:notice] = "You can't create a Physician account"
      redirect_to patient_path(@patient)
    end
    if @physician.save
      login_physician(@physician)
      flash[:notice] = "You have successfully created an account"
    else
      flash[:notice] = "There was an error creating a new Physician"
      render 'physician/new'
    end
  end


  def update
    if @current_physician
      if @current_physician == @physician
        if @physician.update(physician_params)
          flash[:notice] = "Physician details were successfully updated."
          redirect_to physician_path(@physician)
        else
          flash.now[:notice] = "Physician update failed. Fix the fields indicated by the error messages and try again."
          render :new
        end
      else
        flash[:notice] = "You can't edit another Physician's details."
      end
    else
      flash[:notice] = "You can't edit a Physician's details."
  end
end



  def destroy
    @physician.destroy
    redirect_to physician_path
  end




  private

  def physician_params
    params.require(:physician).permit(:name, :email, :specialty, :password)
  end


  def find_physician
    @physician = Physician.find_by(id: params[:id])
  end


end
