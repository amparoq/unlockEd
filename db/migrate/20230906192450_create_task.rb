class CreateTask < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :module
      t.integer :complexity
    
      t.timestamps
    end
  end
end
