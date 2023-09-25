class AddAlternativeQuestionReffToValidAlternativeQuestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :valid_alternative_questions, :alternative_question, null: false, foreign_key: true
  end
end
