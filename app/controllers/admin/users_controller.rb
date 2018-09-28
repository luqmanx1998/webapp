class Admin::UsersController < Admin::MainController
  def index
    @registered_users = User.where.not(invitation_accepted_at: nil,)
    @registered_users = User.all.where.not(invitation_accepted_at: nil)
    @active_daily_users = @registered_users.where("last_seen_at > ?", 1.day.ago)
    @active_weekly_users = @registered_users.where("last_seen_at > ?", 1.week.ago)
    @active_monthly_users = @registered_users.where("last_seen_at > ?", 1.month.ago)
  end
end
