require 'faraday'
require 'faraday_middleware'

module ZenhubRuby
  module Connection
    END_POINT = 'https://api.zenhub.io'.freeze

    def get(path)
      api_connection.get(path)
    end

    private

    def api_connection
      @api_connection  ||= Faraday::Connection.new(END_POINT, connect_options)
    end

    def connect_options
      @connect_options ||= {
        builder: middleware,
        headers: {
          accept: 'application/json',
          user_agent: "ZenhubRuby v#{VERSION}",
          x_authentication_token: access_token
        }
      }
    end

    def middleware
      @middleware ||= Faraday::RackBuilder.new do |builder|
        builder.request :url_encoded
        builder.adapter :net_http
        builder.response :json, content_type: /\bjson$/
      end
    end
  end
end
