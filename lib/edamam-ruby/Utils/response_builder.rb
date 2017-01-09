module Edamam
  module Utils
    class ResponseBuilder
      attr_reader :code, :body
      def initialize(code:, body:)
        @code = code
        @body = body
      end

      def call
        response = OpenStruct.new(body.merge(code: code))
      end
    end
  end
end
