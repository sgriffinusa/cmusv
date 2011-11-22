class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.integer :presentation_id
      t.integer :eye_contact
      t.integer :voice
      t.integer :motion
      t.integer :hands
      t.integer :verbal_clutter
      t.integer :font_size
      t.integer :slide_clutter
      t.integer :distraction
      t.integer :interest
      t.integer :clarity
      t.integer :evenness
      t.integer :timing

      t.text :eye_contact_comment
      t.text :voice_comment
      t.text :motion_comment
      t.text :hands_comment
      t.text :verbal_clutter_comment
      t.text :font_size_comment
      t.text :slide_clutter_comment
      t.text :distraction_comment
      t.text :interest_comment
      t.text :clarity_comment
      t.text :evenness_comment
      t.text :timing_comment

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
