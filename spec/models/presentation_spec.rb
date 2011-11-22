require 'spec_helper'

describe Presentation do
  before do
    User.delete_all
    Course.delete_all
    Team.delete_all

    @faculty_frank = Factory(:faculty_frank)
    @student_sam = Factory(:student_sam)
    @student_sally = Factory(:student_sally)
    @admin_andy = Factory(:admin_andy)
    @course = Factory(:mfse_current_semester, :configure_teams_name_themselves => false)
    @team_triumphant = Factory(:team, :course_id => @course.id, :people => [@student_sam, @student_sally])

    @valid_attributes = {
        :course_id => @course.id,
        :team_id => @team_triumphant.id,
        :individual_user_id => nil,
        :creator_user_id => @faculty_frank.id,
        :title => "Task 1 Presentation",
        :comments => "This is a presentation for Task 1"
    }
  end

  it "should create new presentation with valid attributes" do
    lambda {Presentation.create!(@valid_attributes)}.should_not raise_error
  end

  it "should not allow both team and individual to be specified" do
    @valid_attributes[:team_id] = @team_triumphant.id
    @valid_attributes[:individual_user_id] = @student_sam.id
    presentation = Presentation.create(@valid_attributes)
    presentation.should have(1).errors_on(:team_id)
  end

  it "should require either a team or individual to be specified" do
    @valid_attributes[:team_id] = nil
    @valid_attributes[:individual_user_id] = nil
    presentation = Presentation.create(@valid_attributes)
    presentation.should have(1).errors_on(:team_id)
  end

  it "should require a valid creator" do
    @valid_attributes[:creator_user_id] = nil
    lambda {Presentation.create!(@valid_attributes)}.should raise_error(ActiveRecord::RecordInvalid)

    @valid_attributes[:creator_user_id] = 123456789000
    lambda {Presentation.create!(@valid_attributes)}.should raise_error(ActiveRecord::RecordInvalid)
  end

  it "should have a course" do
     Presentation.create(@valid_attributes).course.should eql @course
  end

  it "should only allow faculty or admin to create a presentation" do
    @valid_attributes[:creator_user_id] = @student_sam.id
    presentation = Presentation.create(@valid_attributes)
    presentation.should have(1).errors_on(:creator)

    @valid_attributes[:creator_user_id] = @faculty_frank.id
        presentation = Presentation.create(@valid_attributes)
    presentation.should have(0).errors_on(:creator)

        @valid_attributes[:creator_user_id] = @admin_andy.id
        presentation = Presentation.create(@valid_attributes)
    presentation.should have(0).errors_on(:creator)
  end

end
