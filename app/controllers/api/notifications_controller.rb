class Api::NotificationsController < ActionController::API

  def index
    @notifications = Notification.where(user: current_user)
    render json: {
      unread_count: @notifications.unread.count
    }
  end



end
