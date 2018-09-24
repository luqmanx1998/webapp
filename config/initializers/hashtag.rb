module SimpleHashtag
  class Hashtag < ActiveRecord::Base
    remove_const(:HASHTAG_REGEX) if (defined?(HASHTAG_REGEX))

    HASHTAG_REGEX = /(\B#(?!(?:\d+|\w+?_|_\w+?)(?:\s|$))([a-z0-9\-_]+))/i
  end
end
