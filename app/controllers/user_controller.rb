class UserController < ApplicationController
  before_action :find_user
  before_action :authenticate_user!
  
  # Followings page
  def index
    @users = current_user.all_following
    if current_user.hide_nsfw == true
      @posts = Post.safe.except_who(current_user).followed(@users).public_post
    else
      @posts = Post.posted.except_who(current_user).followed(@users).public_post
    end
  end
  
  # Profile Page 
  def show
      raise ActionController::RoutingError.new('Not Found') if @user.blank?

      if current_user.hide_nsfw == true && current_user != @user
        @posts = @user.posts.safe.public_post
      else
        @posts = @user.posts.posted
      end

      # Follow button 
      def follow
        @user = User.find(params[:id])
        current_user.follow(@user)
        redirect_back(fallback_location: root_path)
      end
      
      # Unfollow button
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
