class Post::AudiosController < PostController
  before_action :set_media
  before_action :authenticate_user!


  def new
    @post = @media.create
    @post.user = current_user
  end
  private


    def set_media
        @media = Post::Audio
    end



    def post_params
      params.require(:post_audio).permit(:caption, :content, :type, :user_id)
    end
end
