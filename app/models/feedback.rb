class Feedback < ActiveRecord::Base
  belongs_to :presentation
  belongs_to :creator, :class_name=>'User', :foreign_key => 'creator_user_id', :validate => true
end
