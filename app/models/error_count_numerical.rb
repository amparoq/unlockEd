class ErrorCountNumerical < ApplicationRecord
    belongs_to :user
    belongs_to :numerical_question
    belongs_to :task

    after_update :update_streak

    def update_streak
        if self.previous_changes.include?(:error_count)
            old_error_counter = self.previous_changes[:error_count][0]
            new_error_counter = self.previous_changes[:error_count][1]
            if old_error_counter == -1 and new_error_counter == 0
                u_id = self.task.user_tasks.pluck(:user_id)
                u = User.find(u_id)[0]
                if u.streak != 4
                    u.streak += 1
                end
                correctitud = 1
                u.good_questions += 1
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
                if new_error_counter == 1
                    correctitud = -2
                elsif new_error_counter == 0
                    correctitud = 1
                end
                u_id = self.task.user_tasks.pluck(:user_id)
                u = User.find(u_id)[0]
                experiencia = ((((u.streak)**2) * correctitud)/(self.numerical_question.difficulty.to_i + 1))
                u.experience += experiencia
                u.save
            else
                if new_error_counter == 1 || new_error_counter == 2
                    correctitud = -2
                elsif new_error_counter == 0
                    correctitud = 1
                end
                u_id = self.task.user_tasks.pluck(:user_id)
                u = User.find(u_id)[0]
                experiencia = (((u.streak)**2) * correctitud)/((self.numerical_question.difficulty.to_i + 1) * 2)
                u.experience += experiencia
                u.save
            end
        end
    end
end
