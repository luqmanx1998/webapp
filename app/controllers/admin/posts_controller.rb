class Admin::PostsController < Admin::MainController
  def index
    @posts = Post.all
    @texts = @posts.where(type: "Post::Text")
    @images = @posts.where(type: "Post::Image")
    @audios = @posts.where(type: "Post::Audio")
    @views = @posts.sum(:views)
  end
end
