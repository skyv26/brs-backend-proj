require 'rails_helper'

RSpec.describe Service, type: :model do
  subject { Service.new(name: '', icon: '') }
  context 'table test cases checking for either bad argument or invalid information.' do
    describe Service do
      it 'has invalid name column value because name should be string.' do
        subject[:name] = 25.5
        subject[:icon] = true
        expect(subject).not_to be_valid
      end

      # it 'has invalid refund_status column value because refund_status should be string' do
      #   subject[:berth_number] = 12
      #   subject[:amount_paid] = 25.5
      #   subject[:refund_status] = 'asd'
      #   subject[:status] = 'da'
      #   expect(subject).to be_valid
      # end

      # it 'has invalid amount_paid column value because amount_paid should be decimal' do
      #   subject[:berth_number] = 12
      #   subject[:amount_paid] = 25
      #   subject[:refund_status] = 'Your refund is made successfully with $100'
      #   subject[:status] = true
      #   expect(subject).to be_valid
      # end
    end
  end
end
