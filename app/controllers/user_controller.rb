class UserController < ApplicationController
  before_action :find_user
  before_action :authenticate_user!

  def index


  end

  def show
      raise ActionController::RoutingError.new('Not Found') if @user.blank?

      def follow
        @user = User.find(params[:id])
        current_user.follow(@user)
        redirect_back(fallback_location: root_path)
      end

      def unfollow
        @user = User.find(params[:id])
        current_user.stop_following(@user)
        redirect_back(fallback_location: root_path)
      end
  end

  private

  def find_user
    @user = User.find_by_username(params[:username])
  end
end
