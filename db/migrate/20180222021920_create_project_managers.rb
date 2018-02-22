class CreateProjectManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :project_managers do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :title
    end
  end
end
