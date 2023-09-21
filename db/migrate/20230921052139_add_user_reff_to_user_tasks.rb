class AddUserReffToUserTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_tasks, :user, null: false, foreign_key: true
  end
end
