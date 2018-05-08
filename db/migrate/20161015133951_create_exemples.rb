class CreateExemples < ActiveRecord::Migration
  def change
    create_table :exemples do |t|
      t.text :content
      t.boolean :is_fr
      t.boolean :is_li
      t.integer :definition_id
      t.integer :contributor_id
      t.string :source
      t.boolean :is_validated

      t.timestamps null: false
    end
  end
end
