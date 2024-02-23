class GistQuestionService
  GistResult = Struct.new(:success?, :url)

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN', nil))
  end

  def call
    response = @client.create_gist(gist_params)
    GistResult.new(success?: response[:html_url].present?, url: response[:html_url])
  end

  private

  def gist_params
    {
      description: I18n.t('gist.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
