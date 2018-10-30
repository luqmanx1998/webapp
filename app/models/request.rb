class Request < ApplicationRecord
    after_create :send_mail

    def send_mail
        RequestMailer.thanks(self).deliver
    end

    #email validation
    validates :email,
      :format => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      uniqueness: { message: " is already in the waiting list"}
end
  