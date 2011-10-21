require 'spec_helper'

describe ProposalController do
  @user = login_user

  describe "#index" do
    it "should display all proposals" do
      Factory(:proposal, :user => @user)
      get :index
      assigns(:proposals).size.should > 0
      assigns(:proposals).should == Proposal.all
    end
  end

end
