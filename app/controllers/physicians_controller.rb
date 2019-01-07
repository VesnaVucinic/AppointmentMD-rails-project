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
   if @physician
     redirect_to physician_path(@physician)
   elsif @patient
   redirect_to patient_path(@patient)
 end
 @physician = Physician.new
 end



 def edit
   @physician = Physician.find(params[:id])
 end



  def create
    @physician = Physician.new(physician_params)
    if @physician.save
      flash[:notice] = "Successfully created Physician"
      redirect_to physician_path(@physician)
    else
      flash[:notice] = "There was an error creating a new Physician"
      render 'physician/new'
    end
  end


  def update
    @physician = Physician.find(params[:id])
   if @physician.update(physician_params)
     redirect_to physician_path(@physician)
   else
     redirect_to edit_physician_path(@physician)
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
