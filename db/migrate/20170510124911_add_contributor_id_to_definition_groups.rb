class AddContributorIdToDefinitionGroups < ActiveRecord::Migration
  def change
    add_column :definition_groups, :contributor_id, :integer
  end
end
