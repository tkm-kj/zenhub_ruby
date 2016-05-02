require 'zenhub_ruby/connection'
require 'zenhub_ruby/client/api'

module ZenhubRuby
  class Client
    include ZenhubRuby::Connection
    include ZenhubRuby::Client::Api

    attr_reader :access_token

    def initialize(access_token)
      @access_token = access_token
    end
  end
end
