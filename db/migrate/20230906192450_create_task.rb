class CreateTask < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :number
      t.integer :status
      t.integer :attempt, default: 0
      t.integer :complexity
    
      t.timestamps
    end
  end
end
