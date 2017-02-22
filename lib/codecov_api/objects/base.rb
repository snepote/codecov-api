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

      def method_missing(method_name, *arguments, &block)
        super unless valid_methods.include? method_name
        root_element[method_name.to_s]
      end

      def respond_to_missing?(method_name, include_private = false)
        valid_methods.include? method_name || super
      end
    end
  end
end
