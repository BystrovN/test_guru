class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.time_over?
      flash[:notice] = t('.notice.time_is_over')
      redirect_to result_test_passage_path(@test_passage) and return
    end

    if @test_passage.completed?
      BadgeService.new(@test_passage).check_and_issue_badges if @test_passage.success?
      TestsMailer.completed_test(@test_passage).deliver_later
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
