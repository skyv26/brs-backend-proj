require 'rails_helper'

RSpec.describe Route, type: :model do
  subject(:route) { described_class.new(distance: 100, time_duration: 120, departure_time: '2023-07-25 10:00:00') }

  describe 'validation' do
    it { is_expected.to validate_presence_of(:distance) }
    it { is_expected.to validate_numericality_of(:distance).only_integer }
    it { is_expected.to validate_presence_of(:time_duration) }
    it { is_expected.to validate_numericality_of(:time_duration).only_integer }
    it { is_expected.to validate_presence_of(:departure_time) }

    context 'When departure_time is not a valid datetime' do
      subject(:invalid_route) do
        described_class.new(distance: 100, time_duration: 120, departure_time: 'not a datetime')
      end

      it 'is not valid' do
        expect(invalid_route).not_to be_valid
        expect(invalid_route.errors[:departure_time]).to include('must be a valid datetime')
      end
    end
  end
end
