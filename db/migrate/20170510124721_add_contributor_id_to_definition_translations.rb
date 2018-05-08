class AddContributorIdToDefinitionTranslations < ActiveRecord::Migration
  def change
    add_column :definition_translations, :contributor_id, :integer
  end
end
