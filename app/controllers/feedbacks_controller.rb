class FeedbacksController < ApplicationController
  def create
    FeedbackMailer.send_feedback(params[:feedback]).deliver_later
    redirect_to root_path, notice: t('.thanks')
  end
end
