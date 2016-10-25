class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if user_params[:password].empty?
      redirect_to new_user_path
    else
      @user = User.create(user_params)
      login(@user)
      redirect_to user_path(@user.id)
    end
  end

  def show
    if session[:user_id] == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end
end
