require 'json'

module CodecovApi
  module Objects
    class Base
      def initialize(json)
        @data = JSON.parse(json.to_s)
      end

      protected

      def valid_methods
        raise 'valid_methods method not declared'
      end

      def root_element
        raise 'root_element method not declared'
      end

      private

      def method_missing(method, *args, &block)
        super unless valid_methods.include? method
        root_element[method.to_s]
      end
    end
  end
end
