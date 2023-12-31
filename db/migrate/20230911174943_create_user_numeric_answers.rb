class CreateUserNumericAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_numeric_answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :numerical_question, null: false, foreign_key: true
      t.float :last_answer

      t.timestamps
    end
  end
end
