class CreateDefinitionGroups < ActiveRecord::Migration
  def change
    create_table :definition_groups do |t|
      t.integer :definition_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
