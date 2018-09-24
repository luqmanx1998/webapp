class Post::Image < Post
  mount_uploader :content, ImageUploader

  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :caption
end
