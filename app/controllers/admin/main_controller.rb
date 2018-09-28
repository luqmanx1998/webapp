class Admin::MainController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin
  before_action :authenticate_user!

  def index
    @users = User.all.where.not(invitation_accepted_at: nil)
    @posts = Post.all
    @requests = Request.all 
  end

end
