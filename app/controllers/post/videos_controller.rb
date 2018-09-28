class Post::VideosController < PostController
  before_action :set_media
  before_action :authenticate_user!


  def new
    @post = @media.create
    @post.user = current_user
  end
  private


    def set_media
        @media = Post::Video
    end



    def post_params
      params.require(:post_video).permit(:caption, :content, :type, :user_id, :nsfw)
    end
end
