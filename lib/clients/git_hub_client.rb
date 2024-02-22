require 'dotenv/load'

class GitHubClient
  def initialize
    @client = setup_client
  end

  private

  def setup_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN', nil))
  end
end
