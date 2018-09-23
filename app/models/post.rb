class Post < ApplicationRecord
    before_create :set_url
  
    belongs_to :user

    include Storext.model
    store_attributes :preferences do
      nsfw Boolean, default: false
    end
  
  
  
  private
    def set_url
       self.url = "#{ SecureRandom.hex(4)}"
    end
  end
  