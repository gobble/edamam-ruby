require "net/http"
require "uri"
require "ostruct"
require "json"
require "logger"
require "forwardable"
require "edamam-ruby/version"
require "edamam-ruby/utils/errors"
require "edamam-ruby/utils/api"
require "edamam-ruby/total_nutrients"
require "edamam-ruby/utils/connection"
require "edamam-ruby/food_database"
require "edamam-ruby/client"

module Edamam
  class << self
    def logger=(logger)
      @logger = logger
    end

    def log
      @logger ||= initialize_logger
    end

    private

    def initialize_logger
      logger = Logger.new(STDERR)
      logger.level = Logger::DEBUG
      logger.datetime_format = "%Y-%m-%d %H:%M:%S "
      logger
    end
  end

end
