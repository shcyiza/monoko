class AddIsEngToDefinitions < ActiveRecord::Migration[5.0]
  def change
    add_column :definitions, :is_en, :boolean
  end
end
