class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <#{ENV.fetch('SMTP_USER', nil)}>)
  layout 'mailer'
end
