require 'rest-client'
require 'json'

module Codecov
  module Api
    class Base
      def get(*args)
        response
      end

  protected
      def url
        raise 'url not defined'
      end

  private
      def auth_token
        raise 'CODECOV_AUTH_TOKEN ENV VAR not defined' if ENV['CODECOV_AUTH_TOKEN'].nil?
        ENV['CODECOV_AUTH_TOKEN']
      end

      def base_url
        'https://codecov.io/api/gh'
      end

      def response
puts base_url + url
        RestClient::Request.new(
          method: :get,
          url: base_url + url,
          headers: { :Authorization => 'token ' + auth_token }
        ).execute
      end
    end
  end
end
