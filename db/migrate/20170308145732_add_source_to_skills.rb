class AddSourceToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :last_diploma, :text
    add_column :skills, :last_project, :text
  end
end
