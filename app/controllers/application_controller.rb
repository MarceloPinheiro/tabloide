class ApplicationController < ActionController::Base
  class ForbiddenAccess < StandardError; end

  before_action :configure_permitted_parameters, if: :devise_controller?
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end

  
end
