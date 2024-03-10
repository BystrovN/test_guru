class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def show; end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path, notice: t('.notice.created')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.notice.updated')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: t('.notice.deleted')
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :image_url, :description, :rule_type, :condition)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
