class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :admin_user?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user?
    return if logged_in?

    flash[:alert] = 'You must log in to perform this action'
    redirect_to login_path
  end

  def admin_user?
    current_user.admin?
  end

end
