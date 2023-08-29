require 'rails_helper'

RSpec.describe Route, type: :model do
  let(:station1) { Station.create(name: 'Station1', city: 'FTN', state: 'TN01AB1234') }
  let(:station2) { Station.create(name: 'Station2', city: 'FTN', state: 'TN01AB1234') }

  let(:route) do
    described_class.new(start_station: station1, destination_station: station2, distance: 100, time_duration: 120,
                        departure_time: '2023-07-25 10:00:00')
  end

  context 'table test cases checking for either bad argument or invalid information.' do
    describe Route do
      it 'start_station should be exist and valid' do
        route[:start_station_id] = nil
        expect(route).to_not be_valid
      end

      it 'destination_station should be exist and valid' do
        route[:destination_station_id] = nil
        expect(route).to_not be_valid
      end

      it 'distance should not be nil' do
        route[:distance] = nil
        expect(route).to_not be_valid
      end

      it 'distance should not be a string' do
        route[:distance] = 'test'
        expect(route).to_not be_valid
      end

      it 'distance should not be a decimal' do
        route[:distance] = 123.45
        expect(route).to_not be_valid
      end

      it 'time_duration should not be nil' do
        route[:time_duration] = nil
        expect(route).to_not be_valid
      end

      it 'time_duration should not be a string' do
        route[:time_duration] = 'test'
        expect(route).to_not be_valid
      end

      it 'time_duration should not be a decimal' do
        route[:time_duration] = 123.45
        expect(route).to_not be_valid
      end

      it 'departure_time should not be nil' do
        route[:departure_time] = nil
        expect(route).to_not be_valid
      end

      it 'departure_time should not be a plain text' do
        route[:departure_time] = 'a plain text'
        expect(route).to_not be_valid
      end

      it 'departure_time should not be a number' do
        route[:departure_time] = 12_345
        expect(route).to_not be_valid
      end
    end
  end

  context 'table test cases for correct inputs' do
    describe Route do
      it 'should pass the test' do
        expect(route).to be_valid
      end
    end
  end
end
