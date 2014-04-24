require "spec_helper"

describe QuestionController do
  describe "routing" do

    it "root's route to #index" do
      get("/").should route_to("question#index")
    end

  end
end