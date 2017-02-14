require_relative 'base.rb'

module CodecovApi
  module Api
    class Commits < Base
      def initialize(owner, repo)
        @owner = owner
        @repo = repo
      end

      def list(from = nil, to = nil)
        uri = '/commits'
        params = {from: from, to: to}.map do |key, value|
          if value.instance_of?(Time) then
            "#{key}=#{value.utc.strftime('%F %T')}"
          elsif !(value.nil?)
           raise 'not a valid time'
         end
        end.compact
        uri = "#{uri}/?#{params.join('&')}" unless params.empty?
        get_request(uri)
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
