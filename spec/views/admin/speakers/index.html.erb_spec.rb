require 'spec_helper'

describe "admin/speakers/index" do
  before(:each) do
    assign(:admin_speakers, [
      stub_model(Admin::Speaker),
      stub_model(Admin::Speaker)
    ])
  end

  it "renders a list of admin/speakers" do
    render
  end
end
