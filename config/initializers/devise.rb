Devise.setup do |config|

  #config.parent_controller = 'DeviseController'

  # ==> Mailer Configuration
  config.mailer_sender = 'noreply@indielab.xyz'

  # Configure the class responsible to send e-mails.
  config.mailer = 'UserMailer'

  # Configure the parent class responsible to send e-mails.
  config.parent_mailer = 'ActionMailer::Base'

  # ==> ORM configuration
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  config.authentication_keys = [:email]
  config.case_insensitive_keys = [:email, :username]
  config.strip_whitespace_keys = [:email, :username]
  config.params_authenticatable = true
  config.http_authenticatable = false
  config.http_authenticatable_on_xhr = true
  config.http_authentication_realm = 'Application'
  config.paranoid = true
  config.skip_session_storage = [:http_auth]
  config.clean_up_csrf_token_on_authentication = true
  config.reload_routes = true

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 11

  # Set up a pepper to generate the hashed password.
  # config.pepper = 'da290f9bade9258530121f4fd1fb1551cdf2df628400273c84b6b22d980c9bb44fca8861458a1195975d1e51c16bad5f38c16aaa1c216152a8e871d99bd9cbe3'

  config.send_email_changed_notification = false
  config.send_password_change_notification = false

  # ==> Configuration for :invitable
  config.invite_for = 0
  config.invitation_limit = 5
  config.invite_key = {:email => /\A[^@]+@[^@]+\z/}
  config.validate_on_invite = true
  config.resend_invitation = true
  config.invited_by_class_name = 'User'
  config.invited_by_foreign_key = :invited_by_id
  config.invited_by_counter_cache = :invitations_count
  config.allow_insecure_sign_in_after_accept = true

  # ==> Configuration for :confirmable
  config.allow_unconfirmed_access_for = 0.days
  config.confirm_within = 3.days
  config.reconfirmable = true
  config.confirmation_keys = [:email]

  # ==> Configuration for :rememberable
  config.remember_for = 52.weeks
  config.expire_all_remember_me_on_sign_out = false
  config.extend_remember_period = true

  # Options to be passed to the created cookie. For instance, you can set
  # secure: true in order to force SSL only cookies.
  # config.rememberable_options = {}

  # ==> Configuration for :validatable
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Scopes configuration
  config.scoped_views = true
  config.default_scope = :user
  config.sign_out_all_scopes = true

  # ==> Navigation configuration
  config.navigational_formats = ['*/*', :html, :xml,:json]

  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete


  # ==> Turbolinks configuration
  ActiveSupport.on_load(:devise_failure_app) do
    include Turbolinks::Controller
  end
end
