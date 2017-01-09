require "spec_helper"

RSpec.describe Edamam::Client do
  describe "when no app_id or app_key is passed" do
    let(:client) {Edamam::Client.new}

    it "raises MissingKeyError" do
      expect{client}.to raise_error Edamam::Utils::MissingKeyError
    end
  end

  describe "when only app_id is supplied" do
    let(:client) do
      Edamam::Client.new do |client|
        client.app_id = app_id
      end
    end

    it "raises MissingKeyError" do
      expect{client}.to raise_error Edamam::Utils::MissingKeyError
    end

  end

  describe "when only app_key is supplied" do
    let(:client) do
      Edamam::Client.new do |client|
        client.app_key = app_key
      end
    end

    it "raises MissingKeyError" do
      expect{client}.to raise_error Edamam::Utils::MissingKeyError
    end
  end

  describe "when both app_key and app_id are supplied" do
    let(:client) do
      Edamam::Client.new do |client|
        client.app_key = app_key
        client.app_id = app_id
      end
    end

    it "sets a foodstuff instance" do
      expect(client.food_database).to be_an_instance_of Edamam::FoodDatabase
    end
  end
end
