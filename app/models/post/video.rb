class Post::Video < Post
  #uploader
  mount_uploader :content, VideoUploader
  process_in_background :content

  #views
  is_impressionable :counter_cache => true, :column_name => :views, :unique => :user_id

  #hashtag
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :caption
end
