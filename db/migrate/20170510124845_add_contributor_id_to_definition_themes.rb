class AddContributorIdToDefinitionThemes < ActiveRecord::Migration
  def change
    add_column :definition_themes, :contributor_id, :integer
  end
end
