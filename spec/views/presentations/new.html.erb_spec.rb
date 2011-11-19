require 'spec_helper'

describe "presentations/new.html.erb" do
  before(:each) do
    assign(:presentation, stub_model(Presentation).as_new_record)
  end

  it "renders new presentation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => presentations_path, :method => "post" do
    end
  end
end
