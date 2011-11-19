require 'spec_helper'

describe "presentations/index.html.erb" do
  before(:each) do
    assign(:presentations, [
      stub_model(Presentation),
      stub_model(Presentation)
    ])
  end

  it "renders a list of presentations" do
    render
  end
end
