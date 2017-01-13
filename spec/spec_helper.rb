$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "edamam-ruby"
require "webmock"
require "json"
include WebMock::API

WebMock.enable!
