class FeedbacksController < ApplicationController

  def show
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
