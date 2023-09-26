class AddLastTaskToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_task_id, :integer
  end
end
