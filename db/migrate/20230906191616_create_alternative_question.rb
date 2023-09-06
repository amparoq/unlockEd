class CreateAlternativeQuestion < ActiveRecord::Migration[7.0]
  def change
    create_table :alternative_questions do |t|
      t.integer :difficulty
      t.integer :module
      t.string :question
      t.string :alternative_a
      t.string :alternative_b
      t.string :alternative_c
      t.string :alternative_a_answer
      t.string :alternative_b_answer
      t.string :alternative_c_answer
      t.string :correct_alternative

      t.timestamps
    end
  end
end
