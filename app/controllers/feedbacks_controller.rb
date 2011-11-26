class FeedbacksController < ApplicationController
  def show
  end

  def new
  end

  def edit
  end

  def create
    @feedback = Feedback.new(params[:feedback])
#    @presentation.creator = current_user

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
