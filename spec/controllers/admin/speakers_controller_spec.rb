require 'spec_helper'

describe Admin::SpeakersController do

  # This should return the minimal set of attributes required to create a valid
  # Speaker. As you add validations to Admin::Speaker, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :name => "John Doe",
      :event_id => @event.id
    }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SpeakersController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before :all do
    @admin = FactoryGirl.create(:admin)
    @event = FactoryGirl.create(:event)
  end

  login_admin

  describe "GET index" do
    it "assigns all speakers as @admin_speakers" do
      speaker = Speaker.create! valid_attributes
      get :index, :event_id => @event.to_param
      assigns(:speakers).should eq(@event.speakers)
    end
  end

  describe "GET show" do
    it "assigns the requested speaker as @admin_speaker" do
      speaker = Speaker.create! valid_attributes
      get :show, :event_id => @event.to_param, :id => speaker.to_param
      assigns(:speaker).should eq(speaker)
    end
  end

  describe "GET new" do
    it "assigns a new speaker as @admin_speaker" do
      get :new, :event_id => @event.to_param
      assigns(:speaker).should be_a_new(Speaker)
    end
  end

  describe "GET edit" do
    it "assigns the requested speaker as @admin_speaker" do
      speaker = Speaker.create! valid_attributes
      get :edit, :event_id => @event.to_param, :id => speaker.to_param
      assigns(:speaker).should eq(speaker)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Speaker" do
        expect {
          post :create, :event_id => @event.to_param, :speaker => valid_attributes
        }.to change(Speaker, :count).by(1)
      end

      it "assigns a newly created speaker as @admin_speaker" do
        post :create, :event_id => @event.to_param, :speaker => valid_attributes
        assigns(:speaker).should be_a(Speaker)
        assigns(:speaker).should be_persisted
      end

      it "redirects to the created speaker" do
        post :create, :event_id => @event.to_param, :speaker => valid_attributes
        response.should redirect_to([:admin,@event,Speaker.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved speaker as @admin_speaker" do
        # Trigger the behavior that occurs when invalid params are submitted
        Speaker.any_instance.stub(:save).and_return(false)
        post :create, :event_id => @event.to_param, :speaker => {}
        assigns(:speaker).should be_a_new(Speaker)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Speaker.any_instance.stub(:save).and_return(false)
        post :create, :event_id => @event.to_param, :speaker => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested speaker" do
        speaker = Speaker.create! valid_attributes
        # Assuming there are no other speakers in the database, this
        # specifies that the Speaker created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Speaker.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :event_id => @event.to_param, :id => speaker.to_param, :speaker => {'these' => 'params'}
      end

      it "assigns the requested speaker as @admin_speaker" do
        speaker = Speaker.create! valid_attributes
        put :update, :event_id => @event.to_param, :id => speaker.to_param, :speaker => valid_attributes
        assigns(:speaker).should eq(speaker)
      end

      it "redirects to the speaker" do
        speaker = Speaker.create! valid_attributes
        put :update, :event_id => @event.to_param, :id => speaker.to_param, :speaker => valid_attributes
        response.should redirect_to([:admin,@event,speaker])
      end
    end

    describe "with invalid params" do
      it "assigns the speaker as @admin_speaker" do
        speaker = Speaker.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Speaker.any_instance.stub(:save).and_return(false)
        put :update, :event_id => @event.to_param, :id => speaker.to_param, :speaker => {}
        assigns(:speaker).should eq(speaker)
      end

      it "re-renders the 'edit' template" do
        speaker = Speaker.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Speaker.any_instance.stub(:save).and_return(false)
        put :update, :event_id => @event.to_param, :id => speaker.to_param, :speaker => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested speaker" do
      speaker = Speaker.create! valid_attributes
      expect {
        delete :destroy, :event_id => @event.to_param, :id => speaker.to_param
      }.to change(Speaker, :count).by(-1)
    end

    it "redirects to the speakers list" do
      speaker = Speaker.create! valid_attributes
      delete :destroy, :event_id => @event.to_param, :id => speaker.to_param
      response.should redirect_to(admin_event_speakers_url(@event))
    end
  end

end
