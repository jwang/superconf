require 'spec_helper' 

describe ProposalController do
  include Devise::TestHelpers
  #sign_in Factory(:user)

  describe "#index" do
    it "should display all proposals" do
      get :index
      assigns(:proposals).should == Proposal.all
    end
  end

end
