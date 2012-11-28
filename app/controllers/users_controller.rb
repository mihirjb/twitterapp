class UsersController < ApplicationController
  
  def new
    @title = "Signup"
  end
  
  def show
      
    @title = "Showing all users"
    @user = User.all
   end
  
end
