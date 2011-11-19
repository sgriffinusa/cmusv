class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.integer :course_id
      t.integer :team_id
      t.integer :individual_user_id
      t.integer :creator_user_id
      t.text :title
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :presentations
  end
end
