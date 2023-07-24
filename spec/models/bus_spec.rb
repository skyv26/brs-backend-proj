require 'rails_helper'

RSpec.describe Bus, type: :model do
  before(:each) do 
    @bus = Bus.create(name: "Bus 1",bus_number:"1001",capacity:50,enquiry_number:"12fd")
  end

  describe "Creat Object test " do
    it "Check the bus object" do 
      expect(@bus).to be_valid
    end
    
    it "Check the bus object presence validation" do 
      @bus.capacity = nil
      expect(@bus).not_to be_valid
    end
    
    it "Check the bus object numeric validation for capacity" do 
      @bus.capacity ="80f"
      expect(@bus).not_to be_valid
    end 
    
    it "Check the bus object name validation" do 
      @bus.name= "Bus hjvfdsdszdsxgf1hgfdchgfhtcghhchfvgchrsrshdjhgyj"
      expect(@bus).to_not be_valid
    end
  end     
end
