require "spec_helper"

describe SponsorsController do
  describe "routing" do

    it "routes to #index" do
      get("/sponsors").should route_to("sponsors#index")
    end

    it "routes to #new" do
      get("/sponsors/new").should route_to("sponsors#new")
    end

    it "routes to #show" do
      get("/sponsors/1").should route_to("sponsors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sponsors/1/edit").should route_to("sponsors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sponsors").should route_to("sponsors#create")
    end

    it "routes to #update" do
      put("/sponsors/1").should route_to("sponsors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sponsors/1").should route_to("sponsors#destroy", :id => "1")
    end

  end
end
