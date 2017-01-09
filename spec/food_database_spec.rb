require "spec_helper"

RSpec.describe Edamam::FoodDatabase do
  let(:food_database) do
    Edamam::Client.new(app_key: app_key, app_id: app_id).food_database
  end
  let(:app_key) {"a530b7c17f2aee6c47101a67c80e2995"}
  let(:app_id) {"4f5f38dd"}

  describe "#request" do
    it "returns a json object" do
      request = food_database.request("1 large chicken")
    end
  end
end
