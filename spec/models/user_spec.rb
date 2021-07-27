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

  describe "Database tables" do
    it { expect(user).to have_db_column(:email).of_type(:string) }
    it { expect(user).to have_db_column(:username).of_type(:string) }
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

  describe "associations" do
    it { should have_many(:books) }
  end
end

describe "Users", type: :request do
  describe "login_path" do
    before(:all) do
      create(:user)
    end

    context "when valid login" do
      before(:each) do
        build(:user)
        post login_path
      end

      it "should respond with 200 ok" do
        expect(response).to have_http_status(:ok)
      end

      it "should respond with json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

    context "when going to an invalid login_path" do
      before(:each) do
        @invaild_user = FactoryBot.build(:user, :invalid)
        post login_path
      end

      it "should be invalid with the wrong username " do
        expect(@invaild_user).to be_invalid
      end
    end
  end
end
