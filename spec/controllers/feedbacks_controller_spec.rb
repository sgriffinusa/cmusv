require 'spec_helper'

describe FeedbacksController do

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "creates a new Feedback" do
      expect {
        post :create
      }.to change(Feedback, :count).by(1)
      response.should redirect_to(Feedback.last)
      flash[:notice].should eq 'Feedback was successfully recorded.'
    end

    context "with logged in faculty" do
      before do
        User.delete_all
        @frank = Factory(:faculty_frank)
        login(@frank)
      end

      it "should capture the faculty entering the feedback" do
        post :create

        assigns(:feedback).creator.id.should == @frank.id
      end
    end

    context "with no one logged in" do
      it "should not capture a creator for the feedback" do
        post :create

        assigns(:feedback).creator.should be_nil
      end
    end

    context "with logged in student" do
      before do
        User.delete_all
        @sam = Factory(:student_sam)
        login(@sam)
      end

      it "should not capture a creator for the feedback" do
        post :create

        assigns(:feedback).creator.should be_nil
      end
    end

    context "create fails" do
      before do
        Feedback.any_instance.stub(:save).and_return false
      end

      it "should render the new action" do
        post :create

        response.should render_template("new")
      end
    end
  end

  describe "POST 'update'" do
    it "should be successful" do
    end
  end

  describe "POST 'destroy'" do
    it "should be successful" do
      get 'destroy'
      response.should be_success
    end
  end

end