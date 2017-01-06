module Edamam
  class Client
    attr_accessor :api_key, :app_id
    def_delegators :@food_database, :request
    def initialize(**args)
      args.each_pair do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
      yield self if block_given?
      @food_database = FoodDatabase.new self
    end

  end
end
