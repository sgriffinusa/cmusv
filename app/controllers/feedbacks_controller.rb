class FeedbacksController < ApplicationController


  layout 'cmu_sv_no_pad'


  # GET /feedbacks/1
  # GET /feedbacks/1.xml

  def show
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @feedback }
    end
  end

  def new
  end

  def edit
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    if (!current_user.nil? && !current_user.is_student)
      @feedback.creator = current_user
    end

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to(@feedback, :notice => 'Feedback was successfully recorded.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
  end

  def destroy
  end

end
