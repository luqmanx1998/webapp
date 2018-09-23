class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :authenticate_admin

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:account_update, keys: [:username ,:name, :bio, :password, :password_confirmation, :hide_nsfw])
  devise_parameter_sanitizer.permit(:accept_invitation, keys: [ :username, :name])
end

private

  def authenticate_admin
    if current_user.access_level == "user"
      return redirect_to root_path, notice: "You are not authorized"
    end
  end

end
