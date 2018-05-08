class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name_li
      t.string :name_fr

      t.timestamps null: false
    end
  end
end
