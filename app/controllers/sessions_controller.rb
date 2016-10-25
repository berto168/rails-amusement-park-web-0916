class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    # byebug
    if user.nil?
      redirect_to root_path
    elsif
      user.authenticate(params[:user][:password])
      login(user)
      redirect_to user_path(user)
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
