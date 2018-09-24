class SearchController < ApplicationController
  before_action :remove_empty_query_params
  before_action :authenticate_user!

  def index
    if params["q"]
      if params["type"] == "human"
        @users = User.ransack( name_or_username_cont: params[:q]).result(distinct:true)
      else
        @posts = Post.ransack(caption_or_user_username_or_user_name_cont: params[:q]).result(distinct:true)
      end
    end
  end

  
private

def remove_empty_query_params
    # Rewrites /projects?q=&status=failing to /projects?status=failing
    require 'addressable/uri'
    original = request.original_url
    parsed = Addressable::URI.parse(original)
    return unless parsed.query_values.present?
    queries_with_values = parsed.query_values.reject { |_k, v| v.blank? }
    if queries_with_values.blank?
      parsed.omit!(:query)
    else parsed.query_values = queries_with_values
    end
    redirect_to parsed.to_s unless parsed.to_s == original
  end
end
