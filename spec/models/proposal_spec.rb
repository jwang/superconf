require 'spec_helper'

describe Proposal do
  describe "associations" do
    it { should belong_to :user }
  end
  describe "validations" do
    it { should validate_presence_of :user }
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end
end
