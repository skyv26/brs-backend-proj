require 'rails_helper'

RSpec.describe Station, type: :model do
  subject { described_class.new(name: 'Station1', city: 'FTN', state: 'TN01AB1234') }

  describe 'Validations' do

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a city' do
    subject.city = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name longer than 50 characters' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end
   end
end
