class UserMailer < Devise::Mailer
  default from: ENV["DEFAULT_FROM_EMAIL"]
  before_action :add_inline_attachments!

  def reset_password_instructions(record, token, opts = {})
    super
    UserMailerJob.perform_later
  end

  private

  def add_inline_attachments!
    attachments.inline["logo3.png"] = File.read(Rails.root.join("app/assets/images/logo3.png"))
  end
end
