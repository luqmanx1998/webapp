class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_last_seen_at, if: proc { user_signed_in? && (current_user.last_seen_at.nil? || current_user.last_seen_at < 1.day.ago) }
  helper_method :authenticate_admin

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:account_update, keys: [:username ,:name, :bio, :password, :password_confirmation, :hide_nsfw, interest_ids: []])
  devise_parameter_sanitizer.permit(:accept_invitation, keys: [ :username, :name])
  devise_parameter_sanitizer.permit(:invite, keys: [ :email])
end

private

  def set_last_seen_at
    current_user.update_column(:last_seen_at, Time.now)
  end

  def authenticate_admin
    if current_user.access_level == "user"
      return redirect_to root_path, notice: "You are not authorized"
    end
  end

end
