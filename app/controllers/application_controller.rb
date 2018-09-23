class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :authenticate_admin
  
  protected
  
      def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:account_update, keys: [:username , :password, :password_confirmation])
      end
  
  private
  
    def authenticate_admin
      if current_user.access_level == "user"
        return redirect_to root_path, notice: "You are not authorized"
      end
    end
  
  end
  