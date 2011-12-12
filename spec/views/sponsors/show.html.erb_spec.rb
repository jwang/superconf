require 'spec_helper'

describe "sponsors/show.html.erb" do
  before(:each) do
    @sponsor = assign(:sponsor, stub_model(Sponsor,
      :event => nil,
      :sponsorship_level => nil,
      :name => "Name",
      :description => "MyText",
      :logo_file_name => "Logo File Name",
      :logo_content_type => "Logo Content Type",
      :logo_file_size => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Logo File Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Logo Content Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
