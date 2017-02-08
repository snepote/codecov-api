require_relative 'base.rb'

module Codecov
  module Api
    class FolderTotals < Base
      def initialize(owner, repo, branch = 'master')
        @owner = owner
        @repo = repo
        @branch = branch
      end

      def get(path)
        @path = path
        super
      end

    protected
      def url
        "/#{@owner}/#{@repo}/tree/#{@branch}/#{@path}"
      end
    end
  end
end
