require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(full_name: 'mike benson', email_address: 'mike@benson', date_of_birth: '2000-01-01',
  mobile_no: '1234567890', password: 'password', profile_photo: 'profile.png', role: 'user',
  security_question: "What is your first pet's name?", security_answer: 'cat') }

  context 'test cases for either bad or invalid arguments.' do
    describe User do
      [nil, 1234, '', 'test' * 15, 'AB', true, false].each do |value|
        it 'full name should be a non-empty, > 3 and <= 50 characters long' do
          subject.full_name = value
          expect(subject).to_not be_valid
        end
      end

      [nil, 1234, '', 'test' * 35, 'AB', true, false, 't@'].each do |value|
        it 'email address should be a non-empty, > 2 and <= 128 characters long' do
          subject.email_address = value
          expect(subject).to_not be_valid
        end
      end

      [nil, 1234, true, false].each do |value|
        it 'date of birth address should be string' do
          subject.date_of_birth = value
          expect(subject).to_not be_valid
        end
      end
    end
  end
end
