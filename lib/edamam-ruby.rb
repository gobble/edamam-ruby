require "net/http"
require "uri"
require "ostruct"
require "json"
require "logger"
require_relative "./edamam-ruby/version"
require_relative "./edamam-ruby/utils/errors"
require_relative "./edamam-ruby/utils/api"
require_relative "./edamam-ruby/utils/connection"
require_relative "./edamam-ruby/food_database"
require_relative "./edamam-ruby/client"

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
