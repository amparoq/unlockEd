class AddColumnToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :complexity, :integer
  end
end
