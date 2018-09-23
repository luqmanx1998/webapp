
class UserMailer < Devise::Mailer
    # Deliver an invitation email
    def invitation_instructions(record, token, opts={})
        attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/brand/logo.png")
        @token = token
        devise_mail(record, :invitation_instructions, opts)
       
      end
end
    