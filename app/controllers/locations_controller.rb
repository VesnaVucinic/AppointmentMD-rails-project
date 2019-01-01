require 'pry'
class LocationsController < ApplicationController


  def new
    @location = Location.new
  end

  def show
    find_location
  end

  def index
    @locations = Location.all
  end

  def create
    @location = Location.new(location_params)
    if @location
      @location.save
      flash[:notice] = "A new location was created"
      redirect_to locations_path(@location)
    else
      flash[:notice] = "Sorry, you were not able to create a new location"
      render 'location/new'
    end
  end



  private

  def location_params
    params.require(:location).permit(:name, :street, :city, :state, :zipcode, :hours_of_operation)
  end


  def find_location
    @location = Location.find_by(params[:id])
  end
end
