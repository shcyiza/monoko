class ExempleBelongsToWordNotDefiniton < ActiveRecord::Migration[5.0]
  def change
    change_column :exemples, :definition_id, :word_id
  end
end
