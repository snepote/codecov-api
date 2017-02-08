require_relative 'base.rb'

module Codecov
  module Model
    class Author < Base
      protected

      def valid_methods
        [:service, :name, :email, :username, :service_id]
      end

      def root_element
        @data['author']
      end
    end
  end
end
