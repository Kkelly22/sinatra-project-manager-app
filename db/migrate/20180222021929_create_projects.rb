class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.integer :project_number
      t.string :project_name
      t.integer :delivery_date
      t.integer :budget_remaining
      t.string :status
      t.integer :project_manager_id
      t.integer :client_id
    end
  end
end
