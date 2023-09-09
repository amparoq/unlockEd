class AddNumericalQuestionReffToUserQuestionValue < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_question_values, :numerical_question, null: false, foreign_key: true
  end
end
