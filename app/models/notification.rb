class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :from_user, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  scope :unread, ->{where read_at: nil}
end
