require 'spec_helper'

describe Admin::EventsController do
  def valid_attributes
    Factory.attributes_for(:event) #{}
  end

  before :all do
    @admin = Factory(:admin) if @admin.nil?
  end

  login_admin

  shared_examples_for "an admin events view" do |action, single_action|
    it "should set @active_tab to events" do
      event = Event.create! valid_attributes
      if single_action
        get action, :id => event.to_param
      else
        get action
      end
      assigns(:active_tab).should == "events"
    end
  end

  shared_examples_for "a single admin event view" do |action|
    it "should set @active_tab to events" do
      event = Event.create! valid_attributes
      get action, :id => event.to_param
      assigns(:active_sub_tab).should == "event"
    end
  end

  describe "GET index" do
    it_should_behave_like "an admin events view", :index

    it "assigns all events as @events" do
      Event.destroy_all
      event = Event.create! valid_attributes
      get :index
      assigns(:events).should eq([event])
    end
  end

  describe "GET show" do
    it_should_behave_like "an admin events view", :show, true
    it_should_behave_like "a single admin event view", :show

    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :show, :id => event.to_param
      assigns(:event).should eq(event)
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new
      assigns(:event).should be_a_new(Event)
    end
    it_should_behave_like "an admin events view", :new
  end

  describe "GET edit" do
    before :all do
      @event = Event.create! valid_attributes
    end
    it_should_behave_like "an admin events view", :edit, true
    it_should_behave_like "a single admin event view", :edit

    it "assigns the requested event as @event" do
      get :edit, :id => @event.to_param
      assigns(:event).should eq(@event)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, :event => valid_attributes
        }.to change(Event, :count).by(1)
      end

      it "assigns a newly created event as @event" do
        post :create, :event => valid_attributes
        assigns(:event).should be_a(Event)
        assigns(:event).should be_persisted
      end

      it "redirects to the created event" do
        post :create, :event => valid_attributes
        response.should redirect_to(admin_event_path(Event.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event as @event" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, :event => {}
        assigns(:event).should be_a_new(Event)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, :event => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested event" do
        event = Event.create! valid_attributes
        # Assuming there are no other events in the database, this
        # specifies that the Event created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Event.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => event.id, :event => {'these' => 'params'}
      end

      it "assigns the requested event as @event" do
        event = Event.create! valid_attributes
        put :update, :id => event.id, :event => valid_attributes
        assigns(:event).should eq(event)
      end

      it "redirects to the event" do
        event = Event.create! valid_attributes
        put :update, :id => event.id, :event => valid_attributes
        response.should redirect_to(admin_event_path(event))
      end
    end

    describe "with invalid params" do
      it "assigns the event as @event" do
        event = Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, :id => event.to_param, :event => {}
        assigns(:event).should eq(event)
      end

      it "re-renders the 'edit' template" do
        event = Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, :id => event.to_param, :event => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, :id => event.to_param
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = Event.create! valid_attributes
      delete :destroy, :id => event.to_param
      response.should redirect_to(admin_events_url)
    end
  end
end
