class Post::Text < Post
    include SimpleHashtag::Hashtaggable
    hashtaggable_attribute :caption
end
