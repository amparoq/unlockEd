class CreateUserQuestionValues < ActiveRecord::Migration[7.0]
  def change
    create_table :user_question_values do |t|
      t.string :value_name
      t.float :value
      t.string :statement

      t.timestamps
    end
  end
end
