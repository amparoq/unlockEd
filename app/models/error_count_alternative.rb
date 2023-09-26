class ErrorCountAlternative < ApplicationRecord
    belongs_to :user
    belongs_to :alternative_question
    belongs_to :task

    after_update :update_streak

    def update_streak
        if self.previous_changes.include?(:error_count)
            old_error_counter = self.previous_changes[:error_count][0]
            new_error_counter = self.previous_changes[:error_count][1]
            if old_error_counter == -1 and new_error_counter == 0
                u_id = self.task.user_tasks.pluck(:user_id)
                u = User.find(u_id)[0]
                u.streak += 1
                correctitud = 1
                u.save
            end
            if old_error_counter == -1 and new_error_counter == 1
                u_id = self.task.user_tasks.pluck(:user_id)
                u = User.find(u_id)[0]
                u.streak = 1
                correctitud = -2
                u.save
            end
            if old_error_counter == -1
                u_id = self.task.user_tasks.pluck(:user_id)
                u = User.find(u_id)[0]
                experiencia = ((((u.streak)**2) * correctitud)/(self.alternative_question.difficulty.to_i + 1))*(1.0/3.0)
                u.experience += experiencia
                u.save
            end
        end
    end
end
