class RequestMailer < ApplicationMailer
    def thanks(recipient)
        attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/brand/logo.png")
        mail(to: recipient.email,
             subject: "[Waiting List] Indielab")
      end
end
