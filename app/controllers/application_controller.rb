class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
     user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    "https://5e66cbfdc0a14e1fb14b28962a845f21.vfs.cloud9.us-east-1.amazonaws.com/"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end