class AddUserReffToUserQuestionValue < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_question_values, :user, null: false, foreign_key: true
  end
end
