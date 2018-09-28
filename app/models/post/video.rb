class Post::Video < Post
  mount_uploader :content, VideoUploader
  process_in_background :content

  is_impressionable :counter_cache => true, :column_name => :views, :unique => :user_id

  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :caption
end
