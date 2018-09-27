class Post::Audio < Post
  is_impressionable :counter_cache => true, :column_name => :views, :unique => :user_id

  mount_uploader :content, AudioUploader
  process_in_background :content

  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :caption

  
end
