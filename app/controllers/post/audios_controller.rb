class Post::AudiosController < PostController
  before_action :set_media
  before_action :authenticate_user!


  def new
    @post = @media.create
    @post.user = current_user
    @post.submission_id = params["id"]
    if @post.submission_id?
      @post.submission_type = Challenge
      @challenge= Challenge.find(params[:id])
    end
    
  end
  private


    def set_media
        @media = Post::Audio
    end



    def post_params
      params.require(:post_audio).permit(:caption, :content, :type, :user_id, :nsfw, :submission_type ,:submission_id)
    end
end
