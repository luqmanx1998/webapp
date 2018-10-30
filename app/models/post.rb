class Post < ApplicationRecord
  before_create :set_url
  after_create :notified_users

  #Views
  is_impressionable :counter_cache => true, :column_name => :views, :unique => :user_id

  belongs_to :user
  belongs_to :submission,     polymorphic: true,  optional: true
  has_many :comments,         as: :commentable,   dependent: :destroy
  has_many :notifications,    as: :notifiable,    dependent: :destroy
  

  scope :submitted,   ->  (challenge_id)  { where(  submission_type: 'Challenge', :submission_id => challenge_id).order("created_at DESC") }
  scope :followed,    ->  (users)         { where(  user: users)}
  scope :except_who , ->  (user)          { where.not(  user: user) }
  scope :safe,        ->                  { where.not(  preferences: {"nsfw"=>true}, content_processing: true).order('created_at DESC') }
  scope :nsfw,        ->                  { where.not(  content_processing: true).order('created_at DESC') }
  scope :drafts, -> { where(draft: true) }
  scope :published, -> { where(draft: false) }

  #JSONB STOREXT  
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
  