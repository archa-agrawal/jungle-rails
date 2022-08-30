require 'rails_helper'

RSpec.describe User, type: :model do
  user = nil
  before do
    user = User.new(name:"test1", email:"test1@test1.com", password:"test1", password_confirmation:"test1")
    user.save
  end
  describe 'Validations' do

    it "should be invalid if password and password_confirmation do not match" do
      user.password_confirmation = "fake"
      expect(user).to_not be_valid
    end

    it "should be invalid if email is not unique" do
      user_new = User.new(name:"test2", email:"test1@test1.com", password:"test1", password_confirmation:"test1")
      user_new.save
      expect(user_new).to_not be_valid
    end

    it "should not pass if email is not provided" do
      user.email = ""
      expect(user).to_not be_valid
    end

    it "should not pass if first name is not provided" do
      user.name = ""
      expect(user).to_not be_valid
    end

    it "should not pass if last name is not provided" do
      user.name = ""
      expect(user).to_not be_valid
    end

    it "should not pass if password is not provided" do
      user.password = nil
      expect(user).to_not be_valid
    end

    it "should not pass if password_confirmation is not provided" do
      user.password = "test1"
      user.password_confirmation = ""
      expect(user).to_not be_valid
    end

    it "should not pass if password is less than 6 characters long" do
      user.password = "tt"
      user.password_confirmation = "tt"
      expect(user).to_not be_valid
    end

    it "should not pass if password is more than 16 characters long" do
      user.password = "abcdefghijklmnopqr"
      user.password_confirmation = "abcdefghijklmnopqr"
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
      
    it "should return correct user if email and password is correct" do
      user1 = User.authenticate_with_credentials("test1@test1.com", "test1")
      expect(user1.email).to eq("test1@test1.com")
    end

    it "should return nil if email is wrong" do
      user1 = User.authenticate_with_credentials("test3@test1.com", "test1")
      expect(user1).to be nil
    end

    it "should return nil if password is wrong" do
      user1 = User.authenticate_with_credentials("test1@test1.com", "test111")
      expect(user1).to be nil
    end

    it "should return user if correct email with extra spacses is entered" do
      user1 = User.authenticate_with_credentials("  test1@test1.com  ", "test1")
      expect(user1.email).to eq("test1@test1.com")
    end

    it "should return user if correct email with either upper or lower case is entered" do
      user1 = User.authenticate_with_credentials("TeSt1@test1.Com", "test1")
      expect(user1.email).to eq("test1@test1.com")
    end

  end
end
