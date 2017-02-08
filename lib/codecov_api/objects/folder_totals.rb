require_relative 'base.rb'

module CodecovApi
  module Objects
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
