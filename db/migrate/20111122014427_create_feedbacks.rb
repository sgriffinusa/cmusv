class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.integer :presentation_id
      t.integer :content
      t.integer :organization
      t.integer :visuals
      t.integer :delivery

      t.text :content_comment
      t.text :organization_comment
      t.text :visuals_comment
      t.text :delivery_comment
      t.text :general_comment

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
