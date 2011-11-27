require 'spec_helper'

describe CourseNavigationsController do

  let(:course) { Factory(:course) }

  context "any user can" do
    before do
      login(Factory(:student_sam))
    end

    describe "GET show" do
      before do
        @mock_course = mock("Course")
        @mock_pages = mock("Pages")
        Course.stub!(:find).and_return(@mock_course)
        @mock_course.stub!(:pages).and_return(@mock_pages)
        get :show, :id => course.to_param
      end

      specify { assigns(:course).should_not be_nil }
      specify { assigns(:pages).should_not be_nil }

    end

  end

#  context "any faculty can" do
#    before do
#      login(Factory(:faculty_frank))
#    end
#
#    describe "GET reposition" do
#
#      it ''
#
#    end
#  end

end