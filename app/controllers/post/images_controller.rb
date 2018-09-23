class Post::ImagesController < PostController
  before_action :set_media
  before_action :authenticate_user!
  def new
    @post = @media.create
    @post.user = current_user
  end

  private

    def set_media
      @media = Post::Image
    end

    def post_params
      params.require(:post_image).permit( :caption  , :type, :user_id, :content, :nsfw)
    end
end
