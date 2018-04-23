class ExempleBelongsToWordNotDefiniton < ActiveRecord::Migration[5.0]
  def change
    rename_column :exemples, :definition_id, :word_id
  end
end
