class Api::UserController  < ActionController::API
    before_action :find_user
    before_action :authenticate_user!
  
    def index
      @users = current_user.all_following
    end
  
    private
  
    def find_user
      @user = User.find_by_username(params[:username])
    end

  end
  