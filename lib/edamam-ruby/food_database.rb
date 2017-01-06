module Edamam
  class FoodDatabase

    def initialize(client)
      @client = client
    end

    def request
      request = Utils::Connection.new
      request.get(Utils::Api::FOOD_DATABASE_URL)
    end

  end
end
