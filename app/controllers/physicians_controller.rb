class PhysiciansController < ApplicationController
 before_action :find_physician, only: [:show, :edit, :update]


 def index
   @physicians = Physician.all
 end


 def show
 end



 def new
   @physician = Physician.new
 end



 def edit
 end



  def create
    @physician = Physician.new(physician_params)
    if @physician.save
      flash[:notice] = "Successfully created Physician"
      session[:physician_id] = @physician.id
      redirect_to physician_path(@physician)
    else
      flash[:notice] = "There was an error creating a new Physician"
      render 'physician/new'
    end
  end




  def update
   if @physician.update(physician_params)
     redirect_to physician_path(@physician)
   else
     redirect_to edit_physician_path
   end
  end

  def destroy
    @physician.destroy 
    redirect_to root_path
  end




  private

  def physician_params
    params.require(:physician).permit(:name, :email, :specialty, :password)
  end


  def find_physician
    @physician = Physician.find_by(id: params[:id])
  end


end
