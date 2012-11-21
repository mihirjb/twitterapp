require 'spec_helper'

describe UsersController do
  
  it " New page should have the right title" do
    get "new"
    response.should be_success
  end
  
end
