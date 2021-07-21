require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) do
    described_class.new(
      email: "test@test.com",
      username: "testuser",
      password: "qwerty",
    )
  end

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  describe "validations" do
    it "should be invalid without an email" do
      user.email = nil
      expect(user).to_not be_valid
    end
    it "should be invalid without an username" do
      user.username = nil
      expect(user).to_not be_valid
    end
    it "should be invalid without an password" do
      user.password = nil
      expect(user).to_not be_valid
    end
    it "should be invalid with a password shorter than 6 characters" do
      user.password = "h"
      expect(user).to_not be_valid
    end
    it "should be invalid with email in the wrong format" do
      user.email = "a@@test.com"
      expect(user).to_not be_valid
    end
    it "should check the email is unique" do
      should validate_uniqueness_of(:email).ignoring_case_sensitivity
    end
    it "should check the username is unique" do
      should validate_uniqueness_of(:username).ignoring_case_sensitivity
    end
    it "should check username not valid alphanumeric characters " do
      user.username = "#3#3#**"
      expect(user).to_not be_valid
    end
    it "should check username has no spaces " do
      user.username = "#3 #3#**"
      expect(user).to_not be_valid
    end
  end
end
