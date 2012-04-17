require 'spec_helper'

describe "admin/speakers/new" do
  before(:each) do
    assign(:admin_speaker, stub_model(Admin::Speaker).as_new_record)
  end

  it "renders new admin_speaker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_speakers_path, :method => "post" do
    end
  end
end
