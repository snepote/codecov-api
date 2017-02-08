require 'rest-client'
require 'json'

module Codecov
  module Api
    class Base

    protected
    
      def get_request(path)
        puts base_url + base_path + path
        get_response(base_url + base_path + path)
      end

      def base_path
        raise 'base_path method not defined'
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
          url: url,
          headers: { :Authorization => 'token ' + auth_token }
        ).execute
      end
    end
  end
end
