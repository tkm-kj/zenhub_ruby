require 'zenhub_ruby/connection'
require 'zenhub_ruby/client/api'
require 'zenhub_ruby/github'
require 'zenhub_ruby/version'

module ZenhubRuby
  class Client
    include Connection
    include Client::Api

    attr_reader :zenhub_access_token, :github

    def initialize(zenhub_access_token, github_access_token)
      @zenhub_access_token = zenhub_access_token
      @github = ZenhubRuby::Github.new(github_access_token)
    end
  end
end
