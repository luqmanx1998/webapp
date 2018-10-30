class Post::Audio < Post
  #views
  is_impressionable :counter_cache => true, :column_name => :views, :unique => :user_id

  #uploader
  mount_uploader :content, AudioUploader
  process_in_background :content

  #hashtag
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :caption

end
