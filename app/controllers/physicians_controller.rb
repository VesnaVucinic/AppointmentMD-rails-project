class PhysiciansController < ApplicationController


  def new
    @physician = Physician.new
  end

  def index
    @physicians = Physicians.all
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
    find_physician
  end



  private

  def physician_params
    params.require(:physician).permit(:name, :specialty, :password)
  end


  def find_physician
    @physician = Physician.find_by(params[:id])
  end


end
