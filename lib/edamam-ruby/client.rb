module Edamam
  class Client
    attr_accessor :api_key, :app_id
    def_delegators :@food_database, :request
    def initialize(**args)
      args.each_pair do |attribute, value|
        instance_variable_set("@#{attribute}", value)
      end
      yield self if block_given?
      raise_error_if_keys_not_present
      @food_database = FoodDatabase.new self
    end

    private
    def raise_error_if_keys_not_present
      raise ArgumentError, "Missing Api key or App Id" unless api_key && app_id
    end
  end
end
