class ProfilesController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update]
  def show 
    @user = user.find(params[:id])
  end 
  
  def new
    @user = User.new
  end

  def create
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

private
  def user_params
    params.require(:user).permit(:name, :address, :phone_number, :photo)
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
