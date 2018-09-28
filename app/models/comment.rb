class Comment < ApplicationRecord
  after_create :notified_users_comment
  after_create :notified_users_mention


  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :notifications, as: :notifiable, dependent: :destroy


  def mention
    @mentions ||= begin
      regex = /@([\w]+)/i
      body.scan(regex).flatten
    end
  end


  private

  def mentioned_users
    @mentioned_users ||= User.where(username: mention)
  end


  def notified_users_mention
    mentioned_users.each do |mention|
      return if mention.id == self.user.id
      Notification.create(user_id: mention.id,
      from_user_id: self.user.id, action: "mentioned", notifiable: self )
    end
  end

  def notified_users_comment
    return if self.commentable.user.id == self.user.id
    Notification.create(user_id: self.commentable.user.id,
    from_user_id: self.user.id, action: "commented", notifiable: self)
  end

end
