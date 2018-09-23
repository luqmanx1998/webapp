class PostController < ApplicationController
  before_action :set_post_url
  before_action :owner, only: [:edit]
  before_action :authenticate_user!

  def index
  end

  def show
    raise ActionController::RoutingError.new('Not Found') if @post.blank?
  end

  def new
  end

  def edit
    if @post.user != current_user
      redirect_to root_path
    end
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
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Your post has been deleted' }
    end
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
        params.require(:post_text).permit( :caption  , :type, :user_id, :content, :nsfw)
      end
    end


end
