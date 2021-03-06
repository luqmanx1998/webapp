class Post::TextsController < PostController
  before_action :set_media

  def new
    @post = @media.create
    @post.user = current_user
  end

  private

    def set_media
        @media = Post::Text
    end

    def post_params
      params.require(:post_text).permit( :caption  , :type, :user_id, :content, :nsfw)
    end
end
