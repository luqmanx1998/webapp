class Post::Text < Post
    #views
    is_impressionable :counter_cache => true, :column_name => :views, :unique => :user_id

    #hashtag
    include SimpleHashtag::Hashtaggable
    hashtaggable_attribute :caption
end
