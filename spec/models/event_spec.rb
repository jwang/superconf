require 'spec_helper'

describe Event do
  before :all do 
    @event = Factory(:event)
  end
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "associations" do
    it { should have_many :snippets }
    it { should have_many :sponsors }
    it { should have_many :sponsorship_levels }
  end
end
