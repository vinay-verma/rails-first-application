class ProtectedController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: %i[index]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    flash[:alert] = exception.message
    redirect_to(request.referrer || login_path)
  end

end
