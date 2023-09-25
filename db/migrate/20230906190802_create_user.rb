class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.float :user_level
      t.integer :task_number, default: 0
      t.integer :streak
      t.integer :module
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
