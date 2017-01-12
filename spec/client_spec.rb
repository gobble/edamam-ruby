require "spec_helper"

RSpec.describe Edamam::Client do
  describe 'when no app_id or app_key is passed' do
    it 'raises MissingKeyError' do
      expect{ instantiate_client }.to raise_error Edamam::Utils::MissingKeyError
    end
  end

  describe 'when only app_id is supplied' do
    it 'raises MissingKeyError' do
      expect do
        instantiate_client(app_id: app_id)
      end.to raise_error Edamam::Utils::MissingKeyError
    end

  end

  describe 'when only app_key is supplied' do
    it 'raises MissingKeyError' do
      expect do
        instantiate_client(app_key: app_key)
      end.to raise_error Edamam::Utils::MissingKeyError
    end
  end

  describe 'when both app_key and app_id are supplied' do
    it 'sets a foodstuff instance' do
      client = instantiate_client(app_id: app_id, app_key: app_key)

      expect(client.food_database).to be_an_instance_of Edamam::FoodDatabase
    end
  end

  def instantiate_client(app_key: nil, app_id: nil)
    Edamam::Client.new do |client|
      client.app_key = app_key
      client.app_id = app_id
    end
  end

  def app_id
    "ts_4f5fxxxx"
  end

  def app_key
    "ts_a530b7c17f2aee6c47101a67xxxxxxxx"
  end

end
