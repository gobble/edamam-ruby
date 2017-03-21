module Edamam
  module Response
    class TotalNutrients
      def initialize(total_nutrients:)
        @total_nutrients = total_nutrients
      end

      def kilocalories
        total_nutrients["ENERC_KCAL"]["quantity"]
      end

      private

      attr_reader :total_nutrients
    end
  end
end
