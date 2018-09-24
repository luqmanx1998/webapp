class Post::Audio < Post
  mount_uploader :content, AudioUploader
  process_in_background :content

  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :caption
end
