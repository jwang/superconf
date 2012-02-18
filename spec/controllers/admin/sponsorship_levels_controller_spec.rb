require 'spec_helper'

describe Admin::SponsorshipLevelsController do

  before(:all) do
    @event = Event.create(:name => "Event Sponsorship")
    @admin = Factory(:admin) if @admin.nil?
  end

  login_admin

  after(:all) do
    @event.destroy
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index, :event_id => @event.id
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new, :event_id => @event.id
      response.should be_success
    end
  end

end
