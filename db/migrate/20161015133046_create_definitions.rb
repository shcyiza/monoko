class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.text :content
      t.boolean :is_fr
      t.boolean :is_li
      t.integer :word_id
      t.integer :contributor_id
      t.string :source
      t.boolean :is_validated

      t.timestamps null: false
    end
  end
end
