$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "edamam-ruby"
require 'webmock'
require "json"
require "spec_utils"
include WebMock::API
include SpecUtils

WebMock.enable!
stub_request(:get,
  food_database_path + correct_credentials + ingredient
).to_return(
    status: 200,
    body: RESPONSE.to_json,
    headers: {"Content-Type"=> "application/json"}
  )

stub_request(:get,
  food_database_path + wrong_credentials + ingredient
).to_return(status: 401, body: "")
