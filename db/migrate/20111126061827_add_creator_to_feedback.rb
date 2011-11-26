class AddCreatorToFeedback < ActiveRecord::Migration
  def self.up
     add_column :feedbacks, :creator_user_id, :int
  end

  def self.down
    remove_column :feedbacks, :creator_user_id
  end
end
