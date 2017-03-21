require "spec_helper"

RSpec.describe Edamam::FoodDatabase do
  describe "#nutritional_data" do

    describe "When wrong app_id or app_key is passed" do
      it "raises UnauthorizedError" do
        stub_out_going_request(wrong_credentials, 401, "")
        food_database = instantiate_food_database(
          app_id: app_id + "invalid",
          app_key: app_key
        )

        expect do
          food_database.nutritional_data("1 large chicken")
        end.to raise_error Edamam::Utils::UnauthorizedError
      end
    end

    describe "when the correct credentials are passed" do
      it "returns an object containing the parsed body" do
        stub_out_going_request(correct_credentials, 200, test_response)
        food_database = instantiate_food_database(
          app_key: app_key,
          app_id: app_id
        )
        response = food_database.nutritional_data("1 large chicken")

        expect(response).to be_an_instance_of Edamam::Response::TotalNutrients
      end

      it "returns total nutrients from the response" do
        stub_out_going_request(correct_credentials, 200, test_response)
        food_database = instantiate_food_database(
          app_key: app_key,
          app_id: app_id
        )
        response = food_database.nutritional_data("1 large chicken")
        result = response.kilocalories

        expect(result).to eq(115.96)
      end
    end
  end

  def instantiate_food_database(credentials)
    Edamam::Client.new(
      app_key: credentials[:app_key],
      app_id: credentials[:app_id]
    ).food_database
  end

  def app_id
    "ts_4f5fxxxx"
  end

  def app_key
    "ts_a530b7c17f2aee6c47101a67xxxxxxxx"
  end

  def stub_out_going_request(credentials, status, response)
    stub_request(
      :get,
      food_database_path + credentials + ingredient
    ).to_return(
      status: status,
      body: response,
      headers: { "Content-Type" => "application/json" }
    )
  end

  def wrong_credentials
    "?app_id=#{app_id + 'invalid'}&app_key=#{app_key}"
  end

  def correct_credentials
    "?app_id=#{app_id}&app_key=#{app_key}"
  end

  def food_database_path
    Edamam::Utils::Api::BASE_URL + Edamam::Utils::Api::FOOD_DATABASE_URL
  end

  def ingredient
    "&ingr=1%20large%20chicken"
  end

  def test_response
    {
      calories: 520,
      totalNutrients: {
        ENERC_KCAL: {
          label: "Energy",
          quantity: 115.96,
          unit: "kcal",
        },
      },
    }.to_json
  end
end
