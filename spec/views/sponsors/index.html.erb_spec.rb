require 'spec_helper'

describe "sponsors/index.html.erb" do
  before(:each) do
    assign(:sponsors, [
      stub_model(Sponsor,
        :event => nil,
        :sponsorship_level => nil,
        :name => "Name",
        :description => "MyText",
        :logo_file_name => "Logo File Name",
        :logo_content_type => "Logo Content Type",
        :logo_file_size => 1
      ),
      stub_model(Sponsor,
        :event => nil,
        :sponsorship_level => nil,
        :name => "Name",
        :description => "MyText",
        :logo_file_name => "Logo File Name",
        :logo_content_type => "Logo Content Type",
        :logo_file_size => 1
      )
    ])
  end

  it "renders a list of sponsors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Logo File Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Logo Content Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
