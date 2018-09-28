class Post::Text < Post
    is_impressionable :counter_cache => true, :column_name => :views, :unique => :user_id

    include SimpleHashtag::Hashtaggable
    hashtaggable_attribute :caption
end
