class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end

  def creat
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path
    else
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :address, :phone_number)
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
