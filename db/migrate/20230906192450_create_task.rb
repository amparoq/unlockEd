class CreateTask < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :module
      t.integer :complexity
      t.integer :difficulty
      t.integer :number
    
      t.timestamps
    end
  end
end
