module Edamam
  module Response
    class TotalNutrients
      def initialize(total_nutrients:)
        @total_nutrients = total_nutrients
      end

      NUTRIENT_KEYS = ["sugar", "na", "fat", "enerc_kcal"].freeze

      NUTRIENT_KEYS.each do |nutrient|
        define_method(nutrient) do
          Nutrient.new(total_nutrients[nutrient.upcase])
        end
      end

      alias_method :sodium, :na
      alias_method :kilocalories, :enerc_kcal

      private

      attr_reader :total_nutrients
    end
  end
end
