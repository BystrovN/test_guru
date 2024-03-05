class BadgesController < ApplicationController
  def index
    @badges = Badge.all
    @user_badges = current_user.badges
  end

  def show
    @badge = find_badge
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
