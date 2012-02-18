require 'spec_helper'

describe EventsController do

  # This should return the minimal set of attributes required to create a valid
  # Event. As you add validations to Event, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    Factory.attributes_for(:event) #{}
  end

  before :all do
    @event = Event.create! valid_attributes
  end

  describe "GET index" do
    it "assigns all events as @events" do
      get :index
      assigns(:events).should eq([@event])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      get :show, :id => @event.to_param
      assigns(:event).should eq(@event)
    end
  end

  describe "GET location" do
    it "assigns the requested event as @event" do
      get :location, :id => @event.to_param
      assigns(:event).should eq(@event)
    end

    it "should render the location template" do
      get :location, :id => @event.to_param
      response.should render_template :location
    end

    it "should set @active_tab to 'location'" do
      get :location, :id => @event.to_param
      assigns(:active_tab).should == "location"
    end
  end

  describe "GET program" do
    it "assigns the requested event as @event" do
      get :program, :id => @event.to_param
      assigns(:event).should eq(@event)
    end

    it "should render the location template" do
      get :program, :id => @event.to_param
      response.should render_template :program
    end

    it "should set @active_tab to 'program'" do
      get :program, :id => @event.to_param
      assigns(:active_tab).should == "program"
    end
  end
end
