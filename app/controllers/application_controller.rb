class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def log_in(user)
    session[:session_token] = user.reset_token!
    @current_user = user
  end

  def log_out!
    return false unless logged_in?
    @current_user.reset_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def require_log_in
    redirect_to new_session_url unless logged_in?
  end


end
