require 'spec_helper'

describe "presentations/edit.html.erb" do
  before(:each) do
    @presentation = assign(:presentation, stub_model(Presentation))
  end

  it "renders the edit presentation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => presentations_path(@presentation), :method => "post" do
    end
  end
end
