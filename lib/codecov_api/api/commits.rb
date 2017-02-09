require_relative 'base.rb'

module CodecovApi
  module Api
    class Commits < Base
      def initialize(owner, repo)
        @owner = owner
        @repo = repo
      end

      def list(from = nil, to = nil)
        # todo: add from and to parameters
        get_request('/commits')
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
