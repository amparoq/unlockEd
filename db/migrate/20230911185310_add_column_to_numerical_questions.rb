class AddColumnToNumericalQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :numerical_questions, :answer, :float
  end
end
