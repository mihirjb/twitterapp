require 'spec_helper'

describe User do
  before(:each) do
    @attr = {:name => "foo", :email => "foo@example.com",:password => "foobar", :password_confirmation => "foobar"}
  end

it "should not have a blank name" do
no_name_user = User.create(@attr.merge(:name => ""))
no_name_user.should_not be_valid
end

it "should not have a blank email field" do
no_email_user = User.create(@attr.merge(:email => ""))
no_email_user.should_not be_valid
end

it "should not have a name longer than 50 characters" do
  long_name = "a" * 51
  long_name_user = User.create(@attr.merge(:name => long_name))
  long_name_user.should_not be_valid
end

it "should have a valid email" do
  valid_email_address = %w[foo@example.com foo+vbar@fooba.co.in foo123@yahoo.jp]
  valid_email_user = User.create(@attr.merge(:email => valid_email_address))
  valid_email_user.should be_valid
end

it "should have a valid email to be true" do
  invalid_email_address = %w[foo@example,com foo+vbaratfooba.co.in foo123@y""ahoo.jp]
  invalid_email_user = User.create(@attr.merge(:email => invalid_email_address))
  invalid_email_user.should_not be_valid
end

it "should not be duplicate while inserting email" do
  dupemail = "foo@example.com"
  valid_email_user = User.create(@attr)
  duplicate_email_user = User.create(@attr.merge(:email => dupemail))
  duplicate_email_user.should_not be_valid
end

/#
it "should not be case sensitive while checking for duplicate email" do
  dupemail = "foo@example.com".upcase
  valid_email_user = User.create(@attr)
  duplicate_email_user = User.create(@attr.merge(:email => dupemail))
  duplicate_email_user.should_not be_valid
end
#/
end


describe "Passwords" do
  
  it "should respond to password attribute" do
  User.create(@attr).should respond_to(:password)
  end
  
  it "should respond to password confirmation attribute" do
  User.create(@attr).should respond_to(:password_confirmation)
  end
  
end

describe "Password Validation" do
  
  before(:each) do
      @attr = {:name => "foo", :email => "foo@example.com",:password => "foobar", :password_confirmation => "foobar"}
  end

    it "should have a password with minimum length of 6 characters" do
      invalid_password_less = "a"*5
      user_shortpwd = User.create(@attr.merge(:password => invalid_password_less))
      user_shortpwd.should_not be_valid
    end

    it "should have a password with maximum length of 40 characters" do
      invalid_password_more = "a"*41
      user_longpwd = User.create(@attr.merge(:password => invalid_password_more))
      user_longpwd.should_not be_valid
    end
   
   it "should have matching passwords" do
     invalid_password_confirmation = "invalid"
     user_invalid_confirmation = User.create(@attr.merge(:password => invalid_password_confirmation))
     user_invalid_confirmation.should_not be_valid
    end
end


