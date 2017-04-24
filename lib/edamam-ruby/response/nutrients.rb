module Edamam
  module Response
    class Nutrients
      def initialize(nutrients:)
        @nutrients = nutrients
      end

      NUTRITIONAL_DETAIL_MAP = {
        kilocalories: "ENERC_KCAL",
        fat: "FAT",
        saturated: "FASAT",
        trans: "FATRN",
        monounsaturated: "FAMS",
        polyunsaturated: "FAPU",
        potassium: "K",
        carbs: "CHOCDF",
        fiber: "FIBTG",
        sugars: "SUGAR",
        protein: "PROCNT",
        sodium: "NA",
        calcium: "CA",
        magnesium: "MG",
        iron: "FE",
        zinc: "ZN",
        phosphorus: "P",
        thiamin: "THIA",
        riboflavin: "RIBF",
        niacin: "NIA",
        vitamin_b6: "VITB6A",
        folate: "FOLDFE",
        vitamin_e: "TOCPHA",
        vitamin_k: "VITK1"
      }.freeze

      NUTRITIONAL_DETAIL_MAP.each do |nutrition_name, nutrition_key|
        define_method(nutrition_name) do
          if nutrients[nutrition_key]
            nutrients[nutrition_key]["quantity"]
          end
        end
      end

      private

      attr_reader :nutrients

    end
  end
end
