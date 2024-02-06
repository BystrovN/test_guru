class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render plain: @questions.map(&:body).join("\n")
  end

  def show
    render plain: find_question.body
  end

  def create
    @question = @test.questions.build(question_params)
    @question.save
    render plain: @question.body
  end

  def destroy
    find_question.destroy
    render plain: 'Question deleted successfully'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question ||= @test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found', status: :not_found
  end
end
