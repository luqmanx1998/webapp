module PostHelper

    
      def render_with_mention(content)
        content.gsub /@([\w]+)/i do |match|
            link_to match, profile_path($1).downcase
        end.html_safe
      end
    
end
