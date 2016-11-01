class AddFixesToWords < ActiveRecord::Migration
  def change
    add_column :words, :root, :string
    add_column :words, :structure, :string
    add_column :words, :role, :string
  end
end
