require 'octokit'

module ZenhubRuby
  class Github
    attr_reader :auth

    def initialize(access_token)
      @auth = Octokit::Client.new(access_token: access_token)
    end

    def repo_id(repo_name)
      auth.repo(repo_name).id
    end
  end
end
