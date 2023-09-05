require 'rails_helper'

RSpec.describe Bus, type: :model do
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
    Route.create(
      start_station: station1,
      destination_station: station2,
      distance: 100,
      time_duration: 120,
      departure_time: '2023-07-25 10:00:00'
    )
  end

  let(:agency) do
    User.create(full_name: 'mike benson', email_address: 'mike@benson', date_of_birth: '2000-01-01',
                        mobile_no: '1234567890', password: 'password', profile_photo: 'profile.png', role: 'user',
                        security_question: "What is your first pet's name?", security_answer: 'cat')
  end

  let(:bus) do
    described_class.new(name: 'Bus 1', bus_number: '1001', capacity: 50, enquiry_number: '12fd', agency: )
  end

  context 'test cases for either bad or invalid
  arguments.' do
    describe Bus do
      [nil, '', true, '12', false, 1234].each do |value|
        it 'name should be a string' do
          bus.routes << route
          bus[:name] = value
          expect(bus).to_not be_valid
        end
      end  

      [nil, '', true, '12', false, 1234].each do |value|
        it 'enquiry_number should be a string' do
          bus.routes << route
          bus[:enquiry_number] = value
          expect(bus).to_not be_valid
        end
      end

      [nil, '', true, '12', false, 1234].each do |value|
        it 'enquiry_number should be a string' do
          bus.routes << route
          bus[:bus_number] = value
          expect(bus).to_not be_valid
        end
      end

      [nil, '', true, '12', false].each do |value|
        it 'enquiry_number should be a string' do
          bus.routes << route
          bus[:capacity] = value
          expect(bus).to_not be_valid
        end
      end
    end
  end
end
