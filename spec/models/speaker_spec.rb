require 'spec_helper'

describe Speaker do
  describe "associations" do
    it { should belong_to :event }
  end
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :event_id }
  end
end
