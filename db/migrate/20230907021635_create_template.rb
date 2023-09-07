class CreateTemplate < ActiveRecord::Migration[7.0]
  def change
    create_table :templates do |t|
      t.string :module
      t.string :question
      t.integer :difficulty

      t.timestamps
    end
  end
end
