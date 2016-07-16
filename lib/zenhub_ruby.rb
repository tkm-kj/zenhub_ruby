require 'zenhub_ruby/client'

module ZenhubRuby
  class << self
    def new(zenhub_access_token, github_access_token)
      Client.new(zenhub_access_token, github_access_token)
    end
  end
end
