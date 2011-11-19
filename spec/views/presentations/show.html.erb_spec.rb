require 'spec_helper'

describe "presentations/show.html.erb" do
  before(:each) do
    @presentation = assign(:presentation, stub_model(Presentation))
  end

  it "renders attributes in <p>" do
    render
  end
end
