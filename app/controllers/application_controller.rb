class ApplicationController < ActionController::Base
# before_action :authenticate_user!
# before_action :configure_permitted_parameters, if: :devise_controller?

#   def configure_permitted_parameters
#     devise_parameters_sanitizer.permit(:sign_up, keys: [:name])
#   end
  def after_sign_up_path_for(current_user)
    edit_user_path(current_user) || root_path
  end
  
end
