class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(test_passage.current_question).call

    if result.success?
      Gist.create!(question: test_passage.current_question, url: result.url, user: test_passage.user)
      flash_options = { notice: t('.success', url: view_context.link_to(result.url, result.url, target: '_blank')) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to test_passage, flash_options
  end
end
