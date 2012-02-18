require 'spec_helper'

describe Admin::EventsController do
  def valid_attributes
    Factory.attributes_for(:event) #{}
  end

  before :all do
    @admin = Factory(:admin) if @admin.nil?
  end

  login_admin

  describe "GET index" do
    it "assigns all events as @events" do
      Event.destroy_all
      event = Event.create! valid_attributes
      get :index
      assigns(:events).should eq([event])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :show, :id => event.id.to_s
      assigns(:event).should eq(event)
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new
      assigns(:event).should be_a_new(Event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :edit, :id => event.id.to_s
      assigns(:event).should eq(event)
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
        put :update, :id => event.id.to_s, :event => {}
        assigns(:event).should eq(event)
      end

      it "re-renders the 'edit' template" do
        event = Event.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        put :update, :id => event.id.to_s, :event => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, :id => event.id.to_s
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = Event.create! valid_attributes
      delete :destroy, :id => event.id.to_s
      response.should redirect_to(admin_events_url)
    end
  end
end
