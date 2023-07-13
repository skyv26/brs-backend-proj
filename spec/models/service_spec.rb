require 'rails_helper'

RSpec.describe Service, type: :model do
  subject { Service.new(name: 'asd', icon: true) }

  context 'table test cases checking for either bad argument or invalid information.' do
    describe Service do
      it 'has invalid name column value because name should be string.' do
        subject[:name] = 25.5
        subject[:icon] = true
        p subject
        expect(subject).to be_valid
      end
    end
  end
end
