require 'spec_helper'

describe Admin::SponsorsController do
  before(:all) do
    @admin = Factory(:admin) if @admin.nil?
    @event = Event.create(:name => "Event Name")
  end

  login_admin

  after(:all) do
    @event.destroy
  end

  # This should return the minimal set of attributes required to create a valid
  # Sponsor. As you add validations to Sponsor, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:name => "sponsor", :event_id => @event.to_param}
  end

  shared_examples_for "an admin event sponsors view" do |action, single_action|
    it "should set @active_tab to events" do
      event = Factory(:event)
      sponsor = Factory(:sponsor, :event => event)
      if single_action
        get action, :event_id => event.to_param, :id => sponsor.to_param
      else
        get action, :event_id => event.to_param
      end
      assigns(:active_tab).should == "events"
      assigns(:active_sub_tab).should == "sponsors"
    end
  end


  describe "GET index" do
    it "assigns all sponsors as @sponsors" do
      sponsor = Sponsor.create! valid_attributes
      get :index, :event_id => @event.to_param
      assigns(:sponsors).should eq([sponsor])
    end
    it_should_behave_like "an admin event sponsors view", :index
  end

  describe "GET show" do
    it "assigns the requested sponsor as @sponsor" do
      sponsor = Sponsor.create! valid_attributes
      get :show, :id => sponsor.id.to_s, :event_id => @event.to_param
      assigns(:sponsor).should eq(sponsor)
    end
    it_should_behave_like "an admin event sponsors view", :show, true
  end

  describe "GET new" do
    it "assigns a new sponsor as @sponsor" do
      get :new, :event_id => @event.to_param
      assigns(:sponsor).should be_a_new(Sponsor)
    end
    it_should_behave_like "an admin event sponsors view", :new
  end

  describe "GET edit" do
    it "assigns the requested sponsor as @sponsor" do
      sponsor = Sponsor.create! valid_attributes
      get :edit, :id => sponsor.id.to_s, :event_id => @event.to_param
      assigns(:sponsor).should eq(sponsor)
    end
    it_should_behave_like "an admin event sponsors view", :edit, true
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sponsor" do
        expect {
          post :create, :event_id => @event.to_param, :sponsor => valid_attributes
        }.to change(Sponsor, :count).by(1)
      end

      it "assigns a newly created sponsor as @sponsor" do
        post :create, :event_id => @event.to_param, :sponsor => valid_attributes
        assigns(:sponsor).should be_a(Sponsor)
        assigns(:sponsor).should be_persisted
      end

      it "redirects to the created sponsor" do
        post :create, :event_id => @event.to_param, :sponsor => valid_attributes
        response.should redirect_to([:admin, @event, Sponsor.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sponsor as @sponsor" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sponsor.any_instance.stub(:save).and_return(false)
        post :create, :event_id => @event.to_param, :sponsor => {}
        assigns(:sponsor).should be_a_new(Sponsor)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sponsor.any_instance.stub(:save).and_return(false)
        post :create, :event_id => @event.to_param, :sponsor => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sponsor" do
        sponsor = Sponsor.create! valid_attributes
        # Assuming there are no other sponsors in the database, this
        # specifies that the Sponsor created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Sponsor.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :event_id => @event.to_param, :id => sponsor.id, :sponsor => {'these' => 'params'}
      end

      it "assigns the requested sponsor as @sponsor" do
        sponsor = Sponsor.create! valid_attributes
        put :update, :event_id => @event.to_param, :id => sponsor.id, :sponsor => valid_attributes
        assigns(:sponsor).should eq(sponsor)
      end

      it "redirects to the sponsor" do
        sponsor = Sponsor.create! valid_attributes
        put :update, :event_id => @event.to_param, :id => sponsor.id, :sponsor => valid_attributes
        response.should redirect_to([:admin, @event, sponsor])
      end
    end

    describe "with invalid params" do
      it "assigns the sponsor as @sponsor" do
        sponsor = Sponsor.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sponsor.any_instance.stub(:save).and_return(false)
        put :update, :event_id => @event.to_param, :id => sponsor.id.to_s, :sponsor => {}
        assigns(:sponsor).should eq(sponsor)
      end

      it "re-renders the 'edit' template" do
        sponsor = Sponsor.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sponsor.any_instance.stub(:save).and_return(false)
        put :update, :event_id => @event.to_param, :id => sponsor.id.to_s, :sponsor => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sponsor" do
      sponsor = Sponsor.create! valid_attributes
      expect {
        delete :destroy, :event_id => @event.to_param, :id => sponsor.id.to_s
      }.to change(Sponsor, :count).by(-1)
    end

    it "redirects to the sponsors list" do
      sponsor = Sponsor.create! valid_attributes
      delete :destroy, :event_id => @event.to_param, :id => sponsor.id.to_s
      response.should redirect_to(admin_event_sponsors_url(@event.to_param))
    end
  end

end
