# The presentation model represents a presentation given by a team or individual.
#
# A presentation has the following fields:
#   [course]          The course that a presentation belongs to. Can be null.
#   [team]            The team that is presenting, if it is a team presentation.
#   [individual]      The individual that is presenting, if it is an individual presentation.
#   [creator]         The person that created the presentation instance.
#   [title]           The title of the presentation.
#   [comments]        Description of the presentation, if any.
class Presentation < ActiveRecord::Base
  belongs_to :creator, :class_name=>'User', :foreign_key => 'creator_user_id', :validate => true
  belongs_to :team, :validate => true
  belongs_to :individual, :class_name=>'User', :foreign_key => 'individual_user_id', :validate => true
  belongs_to :course, :validate => true

  validates_presence_of :creator

  validate :team_or_individual, :creator_is_faculty

  protected
  # A presentation has to be for either a team or individual, but not both
  def team_or_individual
    if (team_id && individual_user_id)
      errors.add(:team_id, "A presentation can't belong to both a team and individual")
    elsif (!team_id && !individual_user_id)
      errors.add(:team_id, "A team or individual must be specified")
    end
  end

  # Only faculty or admin are allowed to create presentations
  def creator_is_faculty
    if (creator && !(creator.is_teacher? || creator.is_admin?))
        errors.add(:creator, "Must be faculty or admin to create a presentation")
    end
  end

end
