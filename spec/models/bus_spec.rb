require 'rails_helper'

RSpec.describe Bus, type: :model do
<<<<<<< HEAD
  before(:each) do
    @bus = Bus.create(name: 'Bus 1', bus_number: '1001', capacity: 50, enquiry_number: '12fd')
  end

  describe 'Creat Object test ' do
    it 'Check the bus object' do
      expect(@bus).to be_valid
    end

    it 'Check the bus object presence validation' do
      @bus.capacity = nil
      expect(@bus).not_to be_valid
    end

    it 'Check the bus object numeric validation for capacity' do
      @bus.capacity = '80f'
      expect(@bus).not_to be_valid
    end

    it 'Check the bus object name validation' do
      @bus.name = 'Bus hjvfdsdszdsxgf1hgfdchgfhtcghhchfvgchrsrshdjhgyj'
      expect(@bus).to_not be_valid
    end
=======
  subject { described_class.new(name: 'Bus1', enquiry_number: '1234567890', bus_number: 'TN01AB1234', capacity: 50) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a bus_number' do
    subject.bus_number = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a capacity' do
    subject.capacity = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name longer than 50 characters' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
>>>>>>> 4f34396 (Resolve Linters)
  end
end
