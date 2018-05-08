class CreateDefinitionThemes < ActiveRecord::Migration
  def change
    create_table :definition_themes do |t|
      t.integer :definition_id
      t.integer :theme_id

      t.timestamps null: false
    end
  end
end
