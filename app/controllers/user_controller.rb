class UserController < ApplicationController
  before_action :find_user
  before_action :authenticate_user!

  def index
    @users = current_user.all_following
    if current_user.hide_nsfw == true
      @posts = Post.all.where.not(user: current_user, preferences: {"nsfw"=>true}).where( user: @users ).order('created_at DESC')
    else
      @posts = Post.all.where.not(user: current_user).where( user: @users ).order('created_at DESC')
    end
  end

  def show
      raise ActionController::RoutingError.new('Not Found') if @user.blank?
      if current_user.hide_nsfw == true && current_user != @user
        @posts = @user.posts.order("created_at DESC").where(preferences: {"nsfw"=>false})
      else
        @posts = @user.posts.order("created_at DESC")
      end

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
