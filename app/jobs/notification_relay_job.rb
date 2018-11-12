class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
    html = ApplicationController.render partial: "navigation/notification", formats: [:html]
    ActionCable.server.broadcast "notifications:#{notification.user_id}", {:html => "<img src='/assets/icons/notification-hover.svg'>
    <sup class='noti-dot'></sup>"}
  end
end
