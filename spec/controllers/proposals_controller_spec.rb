require 'spec_helper'

describe ProposalsController do
  @user = login_user

  describe "#index" do
    it "should display all proposals" do
      Factory(:proposal, :user => @user)
      get :index
      assigns(:proposals).size.should > 0
      assigns(:proposals).should == Proposal.all
    end
  end

  describe "#new" do
    it "should make a new proposal" do
      get :new
      assigns(:proposal).should be_a_new(Proposal)
    end

    it "should render the new template" do
      get :new
      response.should render_tmeplate "new"
    end
  end

end
