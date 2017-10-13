class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  
   before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :contact_phone, :contact_email, :image])
  end
  
end
