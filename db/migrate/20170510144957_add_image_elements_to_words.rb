class AddImageElementsToWords < ActiveRecord::Migration
  def change
    add_column :words, :image_title, :string
    add_column :words, :image_description, :text
    add_column :words, :image_url, :string
  end
end
