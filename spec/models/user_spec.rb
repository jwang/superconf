require 'spec_helper'

describe User do
  before :all do
    @user = Factory(:user) if @user.nil?
    @admin = Factory(:admin) if @admin.nil?
  end

  describe "associations" do
    it { should have_many :proposals }
  end

  describe "validations" do
    it { should validate_presence_of :role }
  end

  describe "#admin?" do
    it "should return true if the user's role is 'admin'" do
      @admin.admin?.should be_true
    end

    it "should return false if the user's role is NOT 'admin'" do
      @user.admin?.should be_false
    end
  end
end
