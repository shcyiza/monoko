class CreateDefinitionTranslations < ActiveRecord::Migration
  def change
    create_table :definition_translations do |t|
      t.integer :definition_id
      t.integer :word_id

      t.timestamps null: false
    end
  end
end
