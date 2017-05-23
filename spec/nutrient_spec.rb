require "spec_helper"

RSpec.describe Edamam::Nutrient do
  describe "#quantity" do
    it "should return the quantity of the nutrient" do
      nutrient = Edamam::Nutrient.new(nutrient_analysis)

      quantity = nutrient.quantity

      expect(quantity).to eql(0.2583)
    end
  end

  describe "#label" do
    it "can return the label" do
      nutrient = Edamam::Nutrient.new(nutrient_analysis)

      label = nutrient.label

      expect(label).to eql("Fat")
    end
  end

  describe "#unit" do
    it "returns the unit of a nutrient value" do
      nutrient = Edamam::Nutrient.new(nutrient_analysis)

      unit = nutrient.unit

      expect(unit).to eql("g")
    end
  end

  def nutrient_analysis
    { "label" => "Fat", "quantity" => 0.2583, "unit" => "g" }
  end
end
