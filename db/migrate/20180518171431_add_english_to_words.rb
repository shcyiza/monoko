class AddEnglishToWords < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :is_en, :boolean
  end
end
