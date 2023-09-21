class CreateUserTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tasks do |t|
      t.integer :attempt, default: 0

      t.timestamps
    end
  end
end
