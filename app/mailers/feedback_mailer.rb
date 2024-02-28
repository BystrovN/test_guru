class FeedbackMailer < ApplicationMailer
  def send_feedback(message)
    @message = message
    mail(to: ENV.fetch('ADMIN_EMAIL', nil), subject: 'Feedback from your website')
  end
end
