require "spec_helper"

describe SponsorsController do
  describe "routing" do
    it "routes to #index" do
      get("/sponsors").should route_to("sponsors#index")
    end
  end
end
