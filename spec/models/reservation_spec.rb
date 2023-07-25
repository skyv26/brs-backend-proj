require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:reservation) { Reservation.new(berth_number: '', refund_status: '', amount_paid: '', status: '') }
  context 'table test cases checking for either bad argument or invalid information.' do
    describe Reservation do
      it 'has invalid berth_number column value because berth_number should be integer.' do
        reservation[:amount_paid] = 25.5
        reservation[:status] = true
        expect(reservation).not_to be_valid
      end

      it 'has invalid refund_status column value because refund_status should be string' do
        reservation[:berth_number] = 12
        reservation[:amount_paid] = 25.5
        reservation[:refund_status] = 'asd'
        reservation[:status] = 'da'
        expect(reservation).to be_valid
      end

      it 'has invalid amount_paid column value because amount_paid should be decimal' do
        reservation[:berth_number] = 12
        reservation[:amount_paid] = 25
        reservation[:refund_status] = 'Your refund is made successfully with $100'
        reservation[:status] = true
        expect(reservation).to be_valid
      end
    end
  end
end
