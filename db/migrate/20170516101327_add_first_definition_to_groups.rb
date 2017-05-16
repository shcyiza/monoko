class AddFirstDefinitionToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :first_definition_id, :integer
  end
end
