require 'rails_helper'

RSpec.describe Station, type: :model do
  subject { described_class.new(name: 'Station1', city: 'FTN', state: 'TN01AB1234') }
  context 'table test cases checking for either bad argument or invalid information.' do
    describe Station do
      it 'name should not be nil' do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it 'name should not be integer' do
        subject.name = 1234
        expect(subject).to_not be_valid
      end

      it 'name should not be greater than 20 characters' do
        subject.name = 'test' * 6
        expect(subject).to_not be_valid
      end

      it 'name should not be empty' do
        subject.name = ''
        expect(subject).to_not be_valid
      end

      it 'name should be greater than atleast 3 characters' do
        subject.name = 'AB'
        expect(subject).to_not be_valid
      end

      it 'name should not be boolean' do
        subject.name = true
        expect(subject).to_not be_valid
      end

      it 'name should not be boolean' do
        subject.name = false
        expect(subject).to_not be_valid
      end

      it 'city should not be nil' do
        subject.city = nil
        expect(subject).to_not be_valid
      end

      it 'city should not be integer' do
        subject.city = 1234
        expect(subject).to_not be_valid
      end

      it 'city should not be greater than 20 characters' do
        subject.city = 'test' * 6
        expect(subject).to_not be_valid
      end

      it 'city should not be empty' do
        subject.city = ''
        expect(subject).to_not be_valid
      end

      it 'city should be greater than atleast 3 characters' do
        subject.city = 'AB'
        expect(subject).to_not be_valid
      end

      it 'city should not be boolean' do
        subject.city = true
        expect(subject).to_not be_valid
      end

      it 'city should not be boolean' do
        subject.city = false
        expect(subject).to_not be_valid
      end

      it 'state should not be nil' do
        subject.state = nil
        expect(subject).to_not be_valid
      end

      it 'state should not be integer' do
        subject.state = 1234
        expect(subject).to_not be_valid
      end

      it 'state should not be greater than 20 characters' do
        subject.state = 'test' * 6
        expect(subject).to_not be_valid
      end

      it 'state should not be empty' do
        subject.state = ''
        expect(subject).to_not be_valid
      end

      it 'state should be greater than atleast 3 characters' do
        subject.state = 'AB'
        expect(subject).to_not be_valid
      end

      it 'state should not be boolean' do
        subject.state = true
        expect(subject).to_not be_valid
      end

      it 'state should not be boolean' do
        subject.state = false
        expect(subject).to_not be_valid
      end
    end
  end

  context 'table test cases checking for correct' do
    describe Station do
      it 'should pass the test' do
        expect(subject).to be_valid
      end
    end
  end
end
