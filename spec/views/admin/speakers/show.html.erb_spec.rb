require 'spec_helper'

describe "admin/speakers/show" do
  before(:each) do
    @admin_speaker = assign(:admin_speaker, stub_model(Admin::Speaker))
  end

  it "renders attributes in <p>" do
    render
  end
end
