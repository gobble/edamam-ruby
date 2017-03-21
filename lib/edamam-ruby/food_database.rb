module Edamam
  class FoodDatabase
    attr_reader :client
    def initialize(client)
      @client = client
    end

    def nutritional_data(ingredient)
      connection = Utils::Connection.new
      status_code, response = connection.get(
        Utils::Api::FOOD_DATABASE_URL,
        app_id: client.app_id, app_key: client.app_key, ingr: ingredient
      )
      process_response(status_code, response)
    end

    private

    def process_response(status, body)
      if status
        Response::TotalNutrients.new(total_nutrients: body["totalNutrients"])
      end
    end
  end
end
