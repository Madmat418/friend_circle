module SessionsHelper

  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def log_in(user)
    session[:token] = user.reset_session_token!
  end

  def logged_in?
    !!current_user
  end

end
