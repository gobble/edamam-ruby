require "net/http"
require "uri"
require "ostruct"
require "json"
require "logger"
require "fileutils"
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
      log_file = create_log_file
      logger = Logger.new(log_file)
      logger.level = Logger::DEBUG
      logger.datetime_format = "%Y-%m-%d %H:%M:%S "
      logger
    end

    def create_log_file
      FileUtils::mkdir_p("edamam_log") unless Dir.exists?("edamam_log")
      File.open("edamam_log/edamam.log", "a+")
    end

  end

end
