class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :log_in!
  helper_method :current_user

  private
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_in!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?(user)
    user.session_token == session[:session_token]
  end
end
