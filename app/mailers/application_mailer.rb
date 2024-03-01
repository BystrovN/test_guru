class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('SMTP_USER', nil)
  layout 'mailer'
end
