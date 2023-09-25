class AddAlternativeQuestionReffToErrorCountHintMessage < ActiveRecord::Migration[7.0]
  def change
    add_reference :error_count_alternatives, :alternative_question, null: false, foreign_key: true
    add_reference :error_count_alternatives, :task, null: false, foreign_key: true
  end
end
