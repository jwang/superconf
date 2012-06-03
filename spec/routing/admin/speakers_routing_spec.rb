require "spec_helper"

describe Admin::SpeakersController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/events/1/speakers").should route_to("admin/speakers#index", :event_id => "1")
    end

    it "routes to #new" do
      get("/admin/events/1/speakers/new").should route_to("admin/speakers#new", :event_id => "1")
    end

    it "routes to #show" do
      get("/admin/events/1/speakers/1").should route_to("admin/speakers#show", :event_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/events/1/speakers/1/edit").should route_to("admin/speakers#edit", :event_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/admin/events/1/speakers").should route_to("admin/speakers#create", :event_id => "1")
    end

    it "routes to #update" do
      put("/admin/events/1/speakers/1").should route_to("admin/speakers#update", :event_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/events/1/speakers/1").should route_to("admin/speakers#destroy", :event_id => "1", :id => "1")
    end

  end
end
