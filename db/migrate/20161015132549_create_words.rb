class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.boolean :is_fr
      t.boolean :is_li
      t.string :prononciation
      t.integer :contributor_id
      t.string :source
      t.boolean :is_validated

      t.timestamps null: false
    end
  end
end
