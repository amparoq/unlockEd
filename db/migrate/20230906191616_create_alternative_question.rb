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
      t.boolean :answer_a_show, default: false
      t.boolean :answer_b_show, default: false
      t.boolean :answer_c_show, default: false
      t.string :correct_alternative
      t.integer :error_counter, default: -1

      t.timestamps
    end
  end
end
