require 'spec_helper'
 
describe "Question" do
  it "GET /question" do
    get root_path
    response.status.should be(200)
  end
end