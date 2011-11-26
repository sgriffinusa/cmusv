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

    context "new view failure" do
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
