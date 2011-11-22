require File.join(Rails.root,'spec','factories','factories.rb')

Factory.define :presentation_team, :parent => :presentation do |p|
  p.association :course, :factory => :course
  p.association :team, :factory => :team_triumphant
  p.individual_user_id nil
  p.association :creator, :factory => :faculty_frank
  p.title "Team Task 1 Presentation"
  p.comments "Give a 20min presentation. Requirements: 1,2,3,4,5,6,9"
end


Factory.define :presentation_individual, :parent => :presentation do |p|
  p.course_id nil
  p.team_id nil
  p.association :individual, :factory => :student_sally
  p.association :creator, :factory => :faculty_fagan
  p.title "Individual Task 2 Presentation"
  p.comments "Give a 5min presentation. Requirements: 1,2,3,4,5,6,9"
end