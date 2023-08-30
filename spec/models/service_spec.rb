require 'rails_helper'

RSpec.describe Service, type: :model do
  subject { described_class.new(name: 'Air Conditioner', icon: 'path_to_the_icon') }
  context 'test cases for either
          bad or invalid arguments.' do
    describe Service do
      it 'name should a non-empy atleast 3 and less than 20 character string' do
        [nil, 1234, true, false].each do |value|
          subject.name = value
          expect(subject).to_not be_valid
        end
      end

      it 'icon should a non-empy atleast 3 and less than 20 character string' do
        [nil, 1234, true, false].each do |value|
          subject.icon = value
          expect(subject).to_not be_valid
        end
      end
    end
  end
end
