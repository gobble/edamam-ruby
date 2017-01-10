require "spec_helper"

RSpec.describe Edamam::FoodDatabase do
  describe '#request' do

    describe 'When wrong app_id or app_key is passed' do
      let(:food_database) do
        Edamam::Client.new(
          app_key: app_key,
          app_id: app_id + "invalid"
        ).food_database
      end

      let(:request) { food_database.request('1 large chicken') }
      it 'raises UnauthorizedError' do
        food_database = Edamam::Client.new(
          app_key: app_key,
          app_id: app_id + 'invalid'
        ).food_database

        expect do
          food_database.request('1 large chicken')
        end.to raise_error Edamam::Utils::UnauthorizedError
      end
    end

    describe 'when the correct credentials are passed' do
      it 'returns an object containing the parsed body' do
        food_database = Edamam::Client.new(
          app_key: app_key,
          app_id: app_id
        ).food_database

        response = food_database.request('1 large chicken')

        expect(response).to be_an_instance_of OpenStruct
      end
    end
  end
end
