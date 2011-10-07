require 'spec_helper'

describe Proposal do
  describe "associations" do
    it { should belong_to :user }
  end
end
