require 'spec_helper'

describe PresentationsController do

  context "as logged in faculty" do
    before do
      User.delete_all
      @frank = Factory(:faculty_frank)
      @team = Factory(:team)
      login(@frank)

      Course.stub(:all).and_return([Factory(:fse), Factory(:mfse)])
      Team.stub(:all).and_return([@team])
      Person.stub(:all).and_return([Factory(:student_sam), Factory(:student_sally)])

      def valid_attributes
        {
            :team => @team,
            :creator => @frank,
            :title => 'title',
            :comments => 'comments'
        }
      end
    end

    describe "GET index" do
      it "uses no pad layout" do
        get :index
        response.should render_template(:layout => "cmu_sv_no_pad")
      end

      it "authenticates user" do
        get :index
        controller.current_user.id.should eql @frank.id
      end

      it "assigns all presentations as @presentations" do
        presentation = Presentation.create! valid_attributes
        get :index
        assigns(:presentations).should eq([presentation])
      end
    end

    describe "GET show" do
      it "assigns the requested presentation as @presentation" do
        presentation = Presentation.create! valid_attributes
        get :show, :id => presentation.id.to_s
        assigns(:presentation).should eq(presentation)
      end
    end

    describe "GET new" do
      it "assigns a new presentation as @presentation" do
        get :new
        assigns(:presentation).should be_a_new(Presentation)
      end

      it "assigns all courses as @courses" do
        get :new
        assigns(:courses).should eq(Course.all)
      end

      it "assigns all teams as @teams" do
        get :new
        assigns(:teams).should eq(Team.all)
      end

      it "assigns all individuals as @people" do
        get :new
        assigns(:people).should eq(Person.all)
      end
    end

    describe "GET edit" do
      it "assigns the requested presentation as @presentation" do
        presentation = Presentation.create! valid_attributes
        get :edit, :id => presentation.id.to_s
        assigns(:presentation).should eq(presentation)
      end

      it "assigns all courses as @courses" do
        presentation = Presentation.create! valid_attributes
        get :edit, :id => presentation.id.to_s

        assigns(:courses).should eq(Course.all)
      end

      it "assigns all teams as @teams" do
        presentation = Presentation.create! valid_attributes
        get :edit, :id => presentation.id.to_s

        assigns(:teams).should eq(Team.all)
      end

      it "assigns all individuals as @people" do
        presentation = Presentation.create! valid_attributes
        get :edit, :id => presentation.id.to_s

        assigns(:people).should eq(Person.all)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Presentation" do
          expect {
            post :create, :presentation => valid_attributes
          }.to change(Presentation, :count).by(1)
        end

        it "assigns a newly created presentation as @presentation" do
          post :create, :presentation => valid_attributes
          assigns(:presentation).should be_a(Presentation)
          assigns(:presentation).should be_persisted
        end

        it "redirects to the created presentation" do
          post :create, :presentation => valid_attributes
          response.should redirect_to(Presentation.last)
        end

        it "uses logged in user for creator" do
          post :create, :presentation => {:team => @team}

          assigns(:presentation).creator.id.should eql @frank.id
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved presentation as @presentation" do
          # Trigger the behavior that occurs when invalid params are submitted
          Presentation.any_instance.stub(:save).and_return(false)
          post :create, :presentation => {}
          assigns(:presentation).should be_a_new(Presentation)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Presentation.any_instance.stub(:save).and_return(false)
          post :create, :presentation => {}
          response.should render_template("new")
        end

        it "assigns all courses as @courses" do
          Presentation.any_instance.stub(:save).and_return(false)
          post :create, :presentation => {}
          assigns(:courses).should eq(Course.all)
        end

        it "assigns all teams as @teams" do
          Presentation.any_instance.stub(:save).and_return(false)
          post :create, :presentation => {}
          assigns(:teams).should eq(Team.all)
        end

        it "assigns all individuals as @people" do
          Presentation.any_instance.stub(:save).and_return(false)
          post :create, :presentation => {}
          assigns(:people).should eq(Person.all)
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested presentation" do
          presentation = Presentation.create! valid_attributes
          # Assuming there are no other presentations in the database, this
          # specifies that the Presentation created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Presentation.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => presentation.id, :presentation => {'these' => 'params'}
        end

        it "assigns the requested presentation as @presentation" do
          presentation = Presentation.create! valid_attributes
          put :update, :id => presentation.id, :presentation => valid_attributes
          assigns(:presentation).should eq(presentation)
        end

        it "redirects to the presentation" do
          presentation = Presentation.create! valid_attributes
          put :update, :id => presentation.id, :presentation => valid_attributes
          response.should redirect_to(presentation)
        end
      end

      describe "with invalid params" do
        it "assigns the presentation as @presentation" do
          presentation = Presentation.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Presentation.any_instance.stub(:save).and_return(false)
          put :update, :id => presentation.id.to_s, :presentation => {}
          assigns(:presentation).should eq(presentation)
        end

        it "re-renders the 'edit' template" do
          presentation = Presentation.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Presentation.any_instance.stub(:save).and_return(false)
          put :update, :id => presentation.id.to_s, :presentation => {}
          response.should render_template("edit")
        end

        it "assigns all courses as @courses" do
          presentation = Presentation.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Presentation.any_instance.stub(:save).and_return(false)
          put :update, :id => presentation.id.to_s, :presentation => {}
          assigns(:courses).should eq(Course.all)
        end

        it "assigns all teams as @teams" do
          presentation = Presentation.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Presentation.any_instance.stub(:save).and_return(false)
          put :update, :id => presentation.id.to_s, :presentation => {}
          assigns(:teams).should eq(Team.all)
        end

        it "assigns all individuals as @people" do
          presentation = Presentation.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Presentation.any_instance.stub(:save).and_return(false)
          put :update, :id => presentation.id.to_s, :presentation => {}
          assigns(:people).should eq(Person.all)
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested presentation" do
        presentation = Presentation.create! valid_attributes
        expect {
          delete :destroy, :id => presentation.id.to_s
        }.to change(Presentation, :count).by(-1)
      end

      it "redirects to the presentations list" do
        presentation = Presentation.create! valid_attributes
        delete :destroy, :id => presentation.id.to_s
        response.should redirect_to(presentations_url)
      end
    end

    describe "GET feedback" do
      it "assigns the requested presentation as @presentation" do
        presentation = Presentation.create! valid_attributes
        get :feedback, :id => presentation.id.to_s
        assigns(:presentation).should eq(presentation)
      end
    end

  end
end