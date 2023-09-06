class AddAlternativeQuestionReffToJoinUserAlternativeQuestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :join_user_alternative_questions, :alternative_question, null: false, foreign_key: true
  end
end
