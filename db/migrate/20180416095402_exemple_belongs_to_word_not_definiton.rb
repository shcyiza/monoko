class ExempleBelongsToWordNotDefiniton < ActiveRecord::Migration[5.0]
  def change
    remove_column :exemples, :definition_id
    add_reference :exemples, :word
  end
end
