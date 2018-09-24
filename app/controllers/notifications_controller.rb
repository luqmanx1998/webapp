class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(user: current_user).order("created_at DESC")

  end

  def mark_as_read
    @notifications = Notification.where(user: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end

end
