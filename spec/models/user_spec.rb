require 'spec_helper'

describe User do
  before(:each) do
    @attr = {:name => "foo",:email => "foo@example.com"}
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



end
