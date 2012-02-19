require 'spec_helper'

describe Admin::SponsorshipLevelsController do

  before(:all) do
    @event = Factory(:event)
    @admin = Factory(:admin) if @admin.nil?
  end

  login_admin

  after(:all) do
    @event.destroy
  end

  shared_examples_for "an admin event sponsorship_levels view" do |action, single_action|
    it "should set @active_tab to events" do
      event = Factory(:event)
      sponsorship_level = Factory(:sponsorship_level, :event => event)
      if single_action
        get action, :event_id => event.to_param, :id => sponsorship_level.to_param
      else
        get action, :event_id => event.to_param
      end
      assigns(:active_tab).should == "events"
      assigns(:active_sub_tab).should == "sponsorship_levels"
    end
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index, :event_id => @event.id
      response.should be_success
    end
    it_should_behave_like "an admin event sponsorship_levels view", :index
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new, :event_id => @event.id
      response.should be_success
    end
    it_should_behave_like "an admin event sponsorship_levels view", :new
  end

end
