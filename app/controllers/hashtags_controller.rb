class HashtagsController < ApplicationController
  before_action :authenticate_user!

  def show
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:hashtag])
    @hashtagged = @hashtag.hashtaggables 
  end

end
