require 'spec_helper'

describe ProposalsController do
  def valid_attributes
    FactoryGirl.attributes_for(:proposal)
  end
  before :all do
    @user = FactoryGirl.create(:user)
  end

  login_user

  describe "#index" do
    it "should display the users' proposals" do
      Proposal.destroy_all
      FactoryGirl.create(:proposal, :user => @user)
      other_proposal = FactoryGirl.create(:proposal)
      get :index
      assigns(:proposals).should == @user.proposals
      assigns(:proposals).should_not include(other_proposal)
    end
  end

  describe "#new" do
    it "should make a new proposal" do
      get :new
      assigns(:proposal).should be_a_new(Proposal)
    end

    it "should render the new template" do
      get :new
      response.should render_template "new"
    end
  end

  describe "#create" do
    describe "with valid params" do
      it "should create a new proposal" do
        expect {
          post :create, :proposal => valid_attributes
        }.to change(Proposal,:count).by(1)
      end

      it "should set @proposal.user to current_user"do
        post :create, :proposal => valid_attributes
        assigns(:proposal).user.should == @user
      end

      it "should redirect to the new proposal page" do
        post :create, :proposal => valid_attributes
        response.should redirect_to proposal_path(Proposal.last)
      end
    end

    describe "with invalid prams" do
      it "should not create a new proposal" do
        expect {
          post :create, :proposal => {}
        }.to change(Proposal,:count).by(0)
      end

      it "should re-render the new form" do
        post :create, :proposal => {}
        response.should render_template :new
      end
    end
  end

  describe "#edit" do
    before :all do
      @proposal = FactoryGirl.create(:proposal, :user => @user)
    end

    it "should find the proposal based on id" do
      get :edit, :id => @proposal.to_param
      assigns(:proposal).should == @proposal
    end

    it "should render the new template" do
      get :edit, :id => @proposal.to_param
      response.should render_template :edit
    end

  end

  describe "#update" do
    before :all do
      @proposal = FactoryGirl.create(:proposal, :user => @user )
    end

    describe "with valid params" do
      it "should create a new proposal" do
        put :update, :id => @proposal, :proposal => {:title => "foo", :description => "bar"}
        assigns(:proposal).title.should == "foo"
        assigns(:proposal).description.should == "bar"
      end

      it "should set @proposal.user to current_user"do
        put :update, :id => @proposal, :proposal => valid_attributes
        assigns(:proposal).user.should == @user
      end

      it "should redirect to the new proposal page" do
        put :update, :id => @proposal, :proposal => valid_attributes
        response.should redirect_to proposal_path(Proposal.last)
      end
    end
  end
end
