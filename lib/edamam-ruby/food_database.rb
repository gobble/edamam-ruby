module Edamam
  class FoodDatabase
    attr_reader :client
    def initialize(client)
      @client = client
    end

    def nutritional_data(ingredient)
      connection = Utils::Connection.new
      connection.get(
        Utils::Api::FOOD_DATABASE_URL,
        app_id: client.app_id, app_key: client.app_key, ingr: ingredient
      )
    end
  end
end
