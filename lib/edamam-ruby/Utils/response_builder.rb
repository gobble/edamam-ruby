module Edamam
  module Utils
    class ResponseBuilder
      attr_reader :code, :body
      def initialize(code:, body:)
        @code = code
        @body = body
      end

      def call
        build_response_based_on_status_code
      end
      
      private
      def build_response_based_on_status_code
        if code == "200"
          OpenStruct.new(body.merge(code: code))
        else code == "401"
          OpenStruct.new(code: code, body: "Invalid App Id or App key")
        end
      end
    end
  end
end
