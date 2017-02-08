require_relative 'base.rb'

module Codecov
  module Model
    class FolderTotals < Base
      protected

      def valid_methods
        [:files, :lines, :hits, :misses, :coverage]
      end

      def root_element
        @data['commit']['folder_totals']
      end
    end
  end
end

require_relative '../api/folder_totals.rb'

folder_api = Codecov::Api::FolderTotals.new('hvssle', 'hassle')
puts Codecov::Model::FolderTotals.new(folder_api.get('app/controllers')).coverage
