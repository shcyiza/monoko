class AddImportMetaToWords < ActiveRecord::Migration[5.0]
  def change
    add_column :words, :imported_file, :string
    add_column :words, :imported_row, :string
    add_column :definitions, :imported_file, :string
    add_column :definitions, :imported_row, :string
    add_column :exemples, :imported_file, :string
    add_column :exemples, :imported_row, :string
  end
end
