class PatientsController < ApplicationController
  def new
  end

  def show
    if session[:user.id]
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_path
  end

  def create
    @user = User.new(user_params)

    if @user
      @user.save
      session[:user.id] = @user.id
      redirect_to user_path(@user)
    else
      render 'users/new'
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :age, :height, :date_of_birth)


end
