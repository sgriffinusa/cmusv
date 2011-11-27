module FeedbacksHelper

  def feedback_grade_text
    grades = []
    grades << ["poor", 1]
    grades << ["minimally accepted", 2]
    grades << ["good", 3]
    grades << ["outstanding", 4]
  end
end
