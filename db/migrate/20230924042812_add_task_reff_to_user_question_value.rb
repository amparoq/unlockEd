class AddTaskReffToUserQuestionValue < ActiveRecord::Migration[7.0]
    def change
      add_reference :user_question_values, :task, null: false, foreign_key: true
    end
end
