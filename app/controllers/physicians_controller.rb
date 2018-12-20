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
      session[:physician_id] = @physician.id
      redirect_to physician_path(@physician)
    else
      render 'physician/new'
    end
  end


  def show
    if session[:physician_id]
      @physician = Physician.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end

  private

  def physician_params
    params.require(:physician).permit(:name, :specialty, :password)
  end


end
