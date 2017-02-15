class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError do |error|
    redirect_to root_url, alert: error.message
  end
  
  protect_from_forgery with: :exception
  

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
