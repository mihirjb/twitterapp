class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :name, :password , :password_confirmation
  
  valid_email_format = /[\w+\-.]+@[a-z\-.]+\.[a-z]+/i
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 50
  validates :email, :presence => true,:format => valid_email_format, :uniqueness => true
  validates_length_of :password,:in => 6..40
  validates :password, :confirmation  => true
  
end
