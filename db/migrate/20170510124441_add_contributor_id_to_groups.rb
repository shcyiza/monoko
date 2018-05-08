class AddContributorIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :contributor_id, :integer
  end
end
