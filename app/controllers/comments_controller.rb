class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commentable

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    if @comment.save
      redirect_to post_url(@commentable.url)
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:comment_id])
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to post_url(@commentable.url) }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end


  def set_commentable
      @commentable = Post.find_by_url(params[:url])
  end

end
