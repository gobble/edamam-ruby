module Edamam
  class FoodDatabase

    def initialize(client)
      @client = client
    end

    def request(ingredient)
      request = Utils::Connection.new
      request.get(
        Utils::Api::FOOD_DATABASE_URL,
        {app_id: @client.app_id, app_key: @client.app_key,ingr: ingredient}
      )
    end

  end
end
