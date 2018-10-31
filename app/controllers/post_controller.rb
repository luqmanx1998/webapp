class PostController < ApplicationController
  before_action :set_post_url, except: [:repost]
  before_action :owner, only: [:edit]
  before_action :authenticate_user!
  

  def index
    if current_user.hide_nsfw == true
      @posts = Post.safe.except_who(current_user)
    else
      @posts = Post.nsfw.except_who(current_user)
    end
    
  end


  def show
    raise ActionController::RoutingError.new('Not Found') if @post.blank?
   impressionist(@post, :unique => [:impressionable_type, :impressionable_id, :session_hash]  ) 
  end

  def new
    
  end

  def edit
  end

  def create
    @post = @media.new(post_params)
    @post.user = current_user
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post.url) }
      else
        format.html { render :new }
      end
    end
  end
  
  def repost
    @post = Post.find(params[:id])
    post = current_user.posts.new(post_id: @post.id)
    if post.save
      redirect_to post_url(@post.url)
    else
    redirect_to :back, alert: 'Unable to repost'
    end
  end



  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post.url) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Your post has been deleted'
  end

  private

    def set_post_url
      @post = Post.find_by_url(params[:url])
    end

    def owner
      @post = Post.find_by_url(params[:url])
      unless  @post.user == current_user
         redirect_to(@post.url) and return
      end
    end


    def post_params
      @post = Post.find_by_url(params[:url])
      if  @post.type == "Post::Text"
        params.require(:post_text).permit( :caption  , :type, :user_id, :content,:submission_type ,:submission_id, :nsfw,:draft )
      elsif @post.type == "Post::Image"
        params.require(:post_image).permit( :caption  , :type, :user_id, :content,:submission_type ,:submission_id, :nsfw,:draft)
      elsif @post.type == "Post::Audio"
        params.require(:post_audio).permit( :caption  , :type, :user_id, :content,:submission_type ,:submission_id, :nsfw,:draft)  
      elsif @post.type == "Post::Video"
        params.require(:post_video).permit( :caption  , :type, :user_id, :content,:submission_type ,:submission_id, :nsfw,:draft)  
      end
    end

end



