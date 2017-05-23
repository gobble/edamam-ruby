module Edamam
  class Nutrient
    attr_accessor :label, :quantity, :unit

    def initialize(nutrient_value)
      nutrient_value.each_pair do |key, value|
        send("#{key}=", value)
      end
    end

  end
end
