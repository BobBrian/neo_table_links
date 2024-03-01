class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def authorize_owner
    unless current_user && current_user.role == "Owner"
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end
  end


end
