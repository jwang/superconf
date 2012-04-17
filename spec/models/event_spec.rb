require 'spec_helper'

describe Event do
  before :all do 
    @event = Factory(:event)
  end
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :year }
    #it { should validate_uniqueness_of :year }
  end

  describe "associations" do
    it { should have_many :snippets }
    it { should have_many :sponsors }
    it { should have_many :speakers }
    it { should have_many :sponsorship_levels }
  end
end
