class Post < ApplicationRecord
  before_create :set_url
  after_create :notified_users
  is_impressionable :counter_cache => true, :column_name => :views, :unique => :user_id


  belongs_to :user
  
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
  belongs_to :submission, polymorphic: true, optional: true;

  include Storext.model
  store_attributes :preferences do
    nsfw Boolean, default: false
  end
  
  def mention
    @mentions ||= begin
      regex = /@([\w]+)/i
      caption.scan(regex).flatten
    end
  end



  private

    def notified_users
      mentioned_users.each do |mention|
        return if mention.id == self.user.id
        Notification.create(user_id: mention.id,
        from_user_id: self.user.id, action: "mentioned", notifiable: self )
      end
    end

    def mentioned_users
      @mentioned_users ||= User.where(username: mention)
    end
    def set_url
       self.url = "#{ SecureRandom.hex(4)}"
    end
  end
  