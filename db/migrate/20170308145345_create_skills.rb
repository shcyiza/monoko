class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :user_id
      t.integer :theme_id
      t.boolean :certified
      t.boolean :practiced

      t.timestamps null: false
    end
  end
end
