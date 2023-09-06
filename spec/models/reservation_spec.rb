require 'rails_helper'

RSpec.describe Reservation, type: :model do
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

  let(:passenger1) do
    User.create(full_name: 'mike benson', email_address: 'mike@benson', date_of_birth: '2000-01-01',
                        mobile_no: '1234567890', password: 'password', profile_photo: 'profile.png', role: 'user',
                        security_question: "What is your first pet's name?", security_answer: 'cat')
  end

  let(:service1) do
    Service.create(name: 'Air Conditioner', icon: 'path_to_the_icon')
  end

  let(:service2) do
    Service.create(name: 'Pure Water', icon: 'path_to_the_icon')
  end

  let(:bus) do
    Bus.create(name: 'Bus 1', bus_number: '1001', capacity: 50, enquiry_number: '12fd', agency: )
  end

  let(:reservation) do
    described_class.new(berth_number: 25, refund_status: 'abc'*12, amount_paid: 12.69, user: passenger1, bus: , status: false)
  end

  context 'table test cases checking for either bad argument or invalid information.' do
    describe Reservation do
      [nil, 'test', true, '1234', false].each do |value|
        it 'berth_number should be an integer' do
          reservation[:berth_number] = value
          expect(reservation).not_to be_valid
        end
      end

      [nil, 'test', true, '1234', false].each do |value|
        it 'amount_paid should be an integer' do
          reservation[:amount_paid] = value
          expect(reservation).not_to be_valid
        end
      end

      [nil, 'test', true, '1234', false, 1242, 12_356].each do |value|
        it 'refund_status should be a string and 30-250 characters in length' do
          reservation[:refund_status] = value
          expect(reservation).not_to be_valid
        end
      end

      ['test', '1234', 1234, 12.456, nil].each do |value|
        it 'status should be a boolean either true or false' do
          reservation[:status] = value
          expect(reservation).not_to be_valid
        end
      end
    end
  end

  context 'table test cases checking for either bad argument or invalid information.' do
    describe Reservation do
      [true, false].each do |value|
        it 'status should be a boolean either true or false' do
          reservation[:status] = value
          expect(reservation).to be_valid
        end
      end
    end
  end
end
