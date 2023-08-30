require 'rails_helper'

RSpec.describe Station, type: :model do
  subject { described_class.new(name: 'Station1', city: 'FTN', state: 'TN01AB1234') }
  context 'test cases for either
          bad or invalid arguments.' do
    describe Station do
      it 'name should a non-empy atleast 3 and less than 20 character string' do
        [nil, 1234, '', 'test' * 6, 'AB', true, false].each do |value|
          subject.name = value
          expect(route).to_not be_valid
        end
      end

      it 'city should a non-empy atleast 3 and less than 20 character string' do
        [nil, 1234, '', 'test' * 6, 'AB', true, false].each do |value|
          subject.city = value
          expect(route).to_not be_valid
        end
      end

      it 'state should a non-empy atleast 3 and less than 20 character string' do
        [nil, 1234, '', 'test' * 6, 'AB', true, false].each do |value|
          subject.state = value
          expect(route).to_not be_valid
        end
      end
    end
  end
end
