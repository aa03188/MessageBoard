class ContactMailer < ApplicationMailer
  # method to call to contact the email, using labs
  def contact(email, title, message)
    @email = email
    @title = title
    @message = message

    mail cc: @email
  end
end
