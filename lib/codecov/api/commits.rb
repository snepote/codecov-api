require_relative 'base.rb'

module Codecov
  module Api
    class Commits < Base
      def initialize(owner, repo)
        @owner = owner
        @repo = repo
      end

      def list(from = nil, to = nil)
        # todo: add from and to parameters
        get_request(base_path + '/commits')
      end

      def get(sha)
        get_request("/commit/#{sha}")
      end

      def folder_totals(path, branch = 'master')
        get_request("/tree/#{branch}/#{path}")
      end

    protected
    
      def base_path
        "/#{@owner}/#{@repo}"
      end
    end
  end
end
