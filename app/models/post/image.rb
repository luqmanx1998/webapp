class Post::Image < Post
  is_impressionable :counter_cache => true, :column_name => :views, :unique => :user_id

  mount_uploader :content, ImageUploader

  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :caption
end
