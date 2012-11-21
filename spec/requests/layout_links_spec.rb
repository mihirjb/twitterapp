require 'spec_helper'

describe "LayoutLinks" do
  it "should have a home page at '/'" do
  get '/'
  response.should have.selector('title', :content =>"Home")
end

  it "should have a home page at  '/contact'" do
  get '/contact'
  response.should have.selector('title', :content =>"Contact")
end

  it "should have a home page at '/about'" do
  get '/about'
  response.should have.selector('title', :content =>"About")
end

end
