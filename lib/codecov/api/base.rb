require 'rest-client'
require 'json'

module Codecov
  module Api
    class Base

    protected
    def get_request(url)
      puts base_url + url
      get_response(url)
    end

    private
      def auth_token
        raise 'CODECOV_AUTH_TOKEN ENV VAR not defined' if ENV['CODECOV_AUTH_TOKEN'].nil?
        ENV['CODECOV_AUTH_TOKEN']
      end

      def base_url
        'https://codecov.io/api/gh'
      end

      def get_response(url)
        RestClient::Request.new(
          method: :get,
          url: base_url + url,
          headers: { :Authorization => 'token ' + auth_token }
        ).execute
      end
    end
  end
end
