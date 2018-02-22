class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :description
      t.string :priority
      t.integer :budget
      t.integer :project_manager_id
    end
  end
end
