class UserMailerJob < ApplicationJob
  queue_as :mailer

  def perform(*args)
    puts "Sending reset password instructions through email..."
    # mail = UsersMailer.reset_password_instructions(@user)
    # mail.deliver_later(wait: 2.minute)
  end
end
