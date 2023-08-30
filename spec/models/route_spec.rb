require 'rails_helper'

RSpec.describe Route, type: :model do
  let(:station1) do
    Station.create(
      name: 'Station1',
      city: 'FTN',
      state: 'TN01AB1234'
    )
  end
  let(:station2) do
    Station.create(
      name: 'Station2',
      city: 'FTN',
      state: 'TN01AB1234'
    )
  end

  let(:route) do
    described_class.new(
      start_station: station1,
      destination_station: station2,
      distance: 100,
      time_duration: 120,
      departure_time: '2023-07-25 10:00:00'
    )
  end

  context 'test cases for either bad or invalid
           arguments.' do
    describe Route do
      it 'start_station and destination_station should be exist and valid' do
        route[:start_station_id] = nil
        expect(route).to_not be_valid
        route[:destination_station_id] = nil
        expect(route).to_not be_valid
      end

      it 'distance should be an integer' do
        [nil, 'test', true, '1234'].each do |value|
          route[:distance] = value
          expect(route).to_not be_valid
        end
      end

      it 'time_duration should be an integer' do
        [nil, 'test', true, '1234'].each do |value|
          route[:time_duration] = value
          expect(route).to_not be_valid
        end
      end

      it 'departure_time should be date and time' do
        [nil, 'a plain text', 12_345].each do |value|
          route[:departure_time] = value
          expect(route).to_not be_valid
        end
      end
    end
  end
end
