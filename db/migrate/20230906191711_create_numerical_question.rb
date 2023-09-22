class CreateNumericalQuestion < ActiveRecord::Migration[7.0]
  def change
    create_table :numerical_questions do |t|
      t.integer :difficulty
      t.integer :module
      t.string :question
      t.integer :template
      t.integer :error_count
      t.string :hint
      t.string :domain
      t.boolean :alter_domain

      t.timestamps
    end
  end
end
