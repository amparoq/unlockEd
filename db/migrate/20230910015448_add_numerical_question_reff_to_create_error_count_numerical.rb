class AddNumericalQuestionReffToCreateErrorCountNumerical < ActiveRecord::Migration[7.0]
  def change
    add_reference :error_count_numericals, :numerical_question, null: false, foreign_key: true
  end
end
