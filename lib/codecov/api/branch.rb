require_relative 'base.rb'

module Codecov
  module Api
    class Branch < Base
      def initialize(owner, repo, branch)
        @owner = owner
        @repo = repo
        @branch = branch
      end

    protected
      def url
        "/#{@owner}/#{@repo}/branch/#{@branch}"
      end
    end
  end
end

api = Codecov::Api::Branch.new('hvssle', 'hassle', 'master')
puts api.get
