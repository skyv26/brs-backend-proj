require "rails_helper"

RSpec.describe User, type: :model do
  before(:each) do
    @first_user = User.new(full_name: "mike benson", email_address: "mike@benson", date_of_birth: "2000-01-01",
                           mobile_no: "1234567890", password: "password", profile_photo: "profile.png", role: "admin",
                           security_question: "What is your first pet's name?", security_answer: "cat")
  end

  context "User model validations" do
    it "is valid with valid attributes" do
      expect(@first_user).to be_valid
    end

    it "is not valid without a full name" do
      @first_user.full_name = nil
      expect(@first_user).to_not be_valid
    end
    # Type validation
    it "type validation full name" do
      @first_user.full_name = 567
      expect(@first_user).to be_valid
    end

    it "is not valid without an email address" do
      @first_user.email_address = nil
      expect(@first_user).to_not be_valid
    end

    it "is not valid with a max of 128 characters for email address" do
      @first_user.email_address = "mike.bensonbensonamatacodingbootcampbensonbensonbensonbensonbensonbensonbensonb
      ensonbensonnbensonbensonbensnbensonbensonbensnbensonbensonbens@gmail.com"
      expect(@first_user).to_not be_valid
    end

    it "is not valid with a max of 50 characters for full name" do
      @first_user.full_name = "Mike Benson Mike BensonMike BensonMike Benson Mike Benson"
      expect(@first_user).to_not be_valid
    end
  end
end
