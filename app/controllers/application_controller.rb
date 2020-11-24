class ApplicationController < ActionController::Base
before_action :authenticate_user!
# before_action :configure_permitted_parameters, if: :devise_controller?
before_action :dispatch_user
#   def configure_permitted_parameters
#     devise_parameters_sanitizer.permit(:sign_up, keys: [:name])
#   end

  #TODO First attempt trying to fix devise form
  # def after_sign_up_path_for(current_user)
  #   edit_user_path(current_user) || root_path
  # end

  def dispatch_user
    return unless current_user && request.get?
    path = new_profile_path unless current_user.valid?

    redirect_to path unless path.nil? || path == request.path
  end
end
