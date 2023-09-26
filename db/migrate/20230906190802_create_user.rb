class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.float :user_level, default: 2.0
      t.integer :task_number, default: 1
      t.float :experience, default: 5
      t.integer :streak, default: 1
      t.integer :module, default: 0
      t.integer :role, default: 0
      t.integer :good_questions, default: 0 

      t.timestamps
    end
  end
end
