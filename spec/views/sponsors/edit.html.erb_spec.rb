require 'spec_helper'

describe "sponsors/edit.html.erb" do
  before(:each) do
    @sponsor = assign(:sponsor, stub_model(Sponsor,
      :event => nil,
      :sponsorship_level => nil,
      :name => "MyString",
      :description => "MyText",
      :logo_file_name => "MyString",
      :logo_content_type => "MyString",
      :logo_file_size => 1
    ))
  end

  it "renders the edit sponsor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sponsors_path(@sponsor), :method => "post" do
      assert_select "input#sponsor_event", :name => "sponsor[event]"
      assert_select "input#sponsor_sponsorship_level", :name => "sponsor[sponsorship_level]"
      assert_select "input#sponsor_name", :name => "sponsor[name]"
      assert_select "textarea#sponsor_description", :name => "sponsor[description]"
      assert_select "input#sponsor_logo_file_name", :name => "sponsor[logo_file_name]"
      assert_select "input#sponsor_logo_content_type", :name => "sponsor[logo_content_type]"
      assert_select "input#sponsor_logo_file_size", :name => "sponsor[logo_file_size]"
    end
  end
end
