class CreateIllustrations < ActiveRecord::Migration
  def change
    create_table :illustrations do |t|
      t.string :description
      t.boolean :is_fr
      t.boolean :is_li
      t.string :video
      t.integer :contributor_id
      t.string :source
      t.boolean :is_validated

      t.timestamps null: false
    end
  end
end
