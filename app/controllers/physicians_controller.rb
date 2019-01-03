class PhysiciansController < ApplicationController


  def new
    @physician = Physician.new
  end

  def index
    @physicians = Physician.all
  end


  def create
    @physician = Physician.new(physician_params)
    if @physician
      @physician.save
      flash[:notice] = "Successfully created Physician"
      session[:physician_id] = @physician.id
      redirect_to physician_path(@physician)
    else
      flash[:notice] = "There was an error creating a new Physician"
      render 'physician/new'
    end
  end


  def show
    @physician = Physician.find_by(id: params[:id])
  end

  def edit
    find_physician
  end


  def update
   find_physician
   @physician.update(physician_params)
   if @physician.valid?
     redirect_to physician_path
   else
     redirect_to edit_physician_path
   end
  end

  def destroy
    find_physician
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
