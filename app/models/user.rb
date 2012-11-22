class User < ActiveRecord::Base
  attr_accessible :email, :name
  
  valid_email_format = /[\w+\-.]+@[a-z\-.]+\.[a-z]+/i
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 50
  validates :email, :presence => true,:format => valid_email_format
  
end
