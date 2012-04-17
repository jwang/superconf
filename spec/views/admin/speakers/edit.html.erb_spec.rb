require 'spec_helper'

describe "admin/speakers/edit" do
  before(:each) do
    @admin_speaker = assign(:admin_speaker, stub_model(Admin::Speaker))
  end

  it "renders the edit admin_speaker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_speakers_path(@admin_speaker), :method => "post" do
    end
  end
end
