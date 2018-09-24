module PostHelper

  def render_with_hashtags(content)
    regex = SimpleHashtag::Hashtag::HASHTAG_REGEX
    content.to_s.gsub(regex) do |regex|
      if regex.include?(regex)
        link_to regex, hashtag_path(regex = regex.tr('#', ''))
      else
        regex
      end
    end.html_safe

  end
      def render_with_mention(content)
        content.gsub /@([\w]+)/i do |match|
            link_to match, profile_path($1).downcase
        end.html_safe
      end
    
end
