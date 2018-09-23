class Comment < ApplicationRecord
  after_create :notified_users_comment


  belongs_to :user
  belongs_to :commentable, polymorphic: true

  private

  def notified_users_comment
    return if self.commentable.user.id == self.user.id
    Notification.create(user_id: self.commentable.user.id,
    from_user_id: self.user.id, action: "commented", notifiable: self)
  end

end
