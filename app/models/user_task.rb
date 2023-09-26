class UserTask < ApplicationRecord
    belongs_to :user
    belongs_to :task

    enum status: {
        completed: 2,
        skipped: 1,
        pending: 0
    }

    after_create :assign_questions
    after_create :sum_task_number

    def sum_task_number
        self.user.task_number += 1
        self.user.save
    end

    def assign_questions
        if self.task.complexity == "Simple"
            opciones = ValidAlternativeQuestion.joins(:alternative_question)
            .where(user_id: self.user.id, usable: true, alternative_questions: { module: self.task.module })
            .pluck(:alternative_question_id)
            a_usar = []
            3.times do
                break if opciones.empty?
              
                aleatorio = opciones.sample
                a_usar << aleatorio
                opciones.delete(aleatorio)
            end
            ord_num = 1
            a_usar.each do |altid|
                JoinUserAlternativeQuestion.create(task_id: self.task.id, alternative_question_id: altid, order_number: ord_num)
                ErrorCountAlternative.create(task_id: self.task.id, alternative_question_id: altid, user_id: self.user.id)
                ord_num += 1
            end
        else
            qNum = NumericalQuestion.find_by(module: self.task.module, difficulty: self.task.difficulty)
            JoinUserNumericalQuestion.create(task_id: self.task.id, numerical_question_id: qNum.id )
            ErrorCountNumerical.create(numerical_question_id: qNum.id, task_id: self.task.id, user_id: self.user.id)
        end
    end
end
