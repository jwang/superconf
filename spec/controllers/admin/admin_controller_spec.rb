require 'spec_helper'

describe Admin::AdminController do
  before :all do
    @user = FactoryGirl.create(:user) if @user.nil?
    @admin = FactoryGirl.create(:admin) if @admin.nil?
  end

  context "when logged in as user" do
    login_user
    it "should redirect to the root path" do
      get :dashboard
      response.should redirect_to root_path
    end
  end

  context "when logged in as admin" do
    login_admin
    it "should redirect to the admin path" do
      get :dashboard
      response.should redirect_to admin_events_path
    end
  end

end
