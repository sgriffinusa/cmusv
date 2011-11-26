require 'spec_helper'

describe Feedback do
  before do
    User.delete_all

    @faculty_frank = Factory(:faculty_frank)
    @student_sam = Factory(:student_sam)

    @presentation = Presentation.new({
        :course => Course.new,
        :team => nil,
        :individual => @student_sam,
        :creator => @faculty_frank,
        :title => "Task 1 Presentation",
        :comments => "This is a presentation for Task 1"
    })

    @valid_attributes = {
        :presentation => @presentation,
        :creator => @faculty_frank
    }
  end

  it "should belong to a presentation" do
    Feedback.new(@valid_attributes).presentation.should eql @presentation
  end

  it "should have a creator" do
    Feedback.new(@valid_attributes).creator.should eql @faculty_frank
  end
end
