class CreateTask < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :number
      t.integer :status
      t.integer :correct_count, default: 0

      t.timestamps
    end
  end
end
