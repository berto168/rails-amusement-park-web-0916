class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    render 'app/index.html.erb'
  end

  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !!current_user
  end

  helper_method :logged_in?
  helper_method :current_user

  def require_login
    redirect_to login_path unless logged_in?
  end

end
