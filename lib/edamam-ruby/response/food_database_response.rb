module Edamam
  module Response
    class FoodDatabaseResponse
      def initialize(response:)
        @response = transform_response(response: response)
      end

      def total_nutrients
        @total_nutrients ||= nutrient(nutrients: response.totalNutrients)
      end

      def total_daily
        @total_daily ||= nutrient(nutrients: response.totalDaily)
      end

      private

      attr_reader :response

      def transform_response(response: response)
        OpenStruct.new(response)
      end

      def nutrient(nutrients:)
        Nutrients.new(nutrients: nutrients)
      end

      def method_missing(method_name, *args, &block)
        name = method_name.to_s
        if response.respond_to?(name)
          response.send(name, *args)
        else
          super
        end
      end

      def respond_to_missing?(method_name, include_private = false)
        name = method_name.to_s
        response.respond_to?(name)
      end
    end
  end
end
