class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :async, :validate_on_invite => true

  has_many :posts,          dependent:  :destroy
  has_many :comments,       dependent:  :destroy
  has_many :notifications,  dependent:  :destroy
  has_many :challenges,  dependent:  :destroy
  has_many :user_interests, dependent:  :destroy
  has_many :interests,      dependent:  :destroy, through:    :user_interests

  validates_uniqueness_of :username, allow_blank: true

  #Role
  enum access_level: { user: 0, admin: 1, super_admin: 2}

  #JSONB Storext
  include Storext.model
  store_attributes :preferences do
    hide_nsfw Boolean, default: true
  end

  #Followable
  acts_as_follower
  acts_as_followable

  #Rememberable by default
  def remember_me
   true
  end

  ## => Only require current password for Email and Password change
  validates_confirmation_of :password
  
  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:current_password)
      self.update_without_password(params)
    else
      self.verify_password_and_update(params)
    end
  end

  def update_without_password(params={})
    params.delete(:password)
    params.delete(:password_confirmation)
    result = update_attributes(params)
    clean_up_passwords
    result
  end

  def verify_password_and_update(params)
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if valid_password?(current_password)
      update_attributes(params)
    else
      self.attributes = params
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end
    clean_up_passwords
    result
  end

end
