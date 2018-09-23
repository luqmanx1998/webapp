class Post::Image < Post
  mount_uploader :content, ImageUploader
end
