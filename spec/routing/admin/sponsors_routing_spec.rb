require "spec_helper"

describe Admin::SponsorsController do
  describe "routing" do
    it "routes to #new" do
      get("/admin/events/1/sponsors/new").should route_to("admin/sponsors#new", :event_id => "1")
    end

    it "routes to #show" do
      get("/admin/events/1/sponsors/1").should route_to("admin/sponsors#show", :event_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/events/1/sponsors/1/edit").should route_to("admin/sponsors#edit", :event_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/admin/events/1/sponsors").should route_to("admin/sponsors#create", :event_id => "1")
    end

    it "routes to #update" do
      put("/admin/events/1/sponsors/1").should route_to("admin/sponsors#update", :event_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/events/1/sponsors/1").should route_to("admin/sponsors#destroy", :event_id => "1", :id => "1")
    end
  end
end

