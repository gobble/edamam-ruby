require "spec_helper"

RSpec.describe Edamam::FoodDatabase do

  describe "When wrong app_id or app_key is passed" do
    let(:food_database) do
      Edamam::Client.new(
      app_key: app_key,
      app_id: app_id + "invalid"
    ).food_database
    end

    let(:request) { food_database.request("1 large chicken") }
    it "returns a response object with a body that explains the error" do
      expect(request.body).to include("Invalid App Id or App key")
    end

    it "returns an aunthorize status code" do
      expect(request.code).to eq("401")
    end
  end
end
