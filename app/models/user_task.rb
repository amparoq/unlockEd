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
    after_update :assign_next_task

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
            if self.task.difficulty == 0
                diff = "low"
            end
            if self.task.difficulty == 1
                diff = "medium"
            end
            if self.task.difficulty == 2
                diff = "high"
            end
            qNum = NumericalQuestion.find_by(module: self.task.module, difficulty: self.task.difficulty)
            JoinUserNumericalQuestion.create(task_id: self.task.id, numerical_question_id: qNum.id )
            ErrorCountNumerical.create(numerical_question_id: qNum.id, task_id: self.task.id, user_id: self.user.id)
        end
    end

    def assign_next_task
        if self.previous_changes.include?(:status)
            new_status = self.previous_changes[:status][1]
            if new_status == "completed" || new_status == "skipped"
                if new_status == "skipped"
                    self.user.experience = 0.9*self.user.experience
                    self.user.save
                end
                #primero determino si pasa de modulo, retrocede, o se queda en el mismo:
                if self.user.experience > 20 
                    puts "ACAAAAAAAAAAAAAAAA1"
                    if self.user.module <= 4
                        self.user.module += 1
                        self.user.streak = 2
                        self.user.experience = 5
                        self.user.save
                    end
                elsif self.user.experience < -5
                    puts "ACAAAAAAAAAAAAAAAA2"
                    if self.user.module > 0
                        self.user.module -= 1
                        self.user.streak = 1
                        self.user.experience = 5
                        self.user.save
                        all_alternatives = self.user.valid_alternative_questions
                        all_alternatives.each do |al|
                            if al.alternative_question.module == self.user.module
                                al.usable = true
                                al.save
                            end
                        end
                    end
                end

                #luego debo determinar si le toca de alternativa o de desarrollo:
                if self.task.module == self.user.module
                    if self.task.complexity == "Simple"
                        #le toca de desarrollo
                        new_complexity = 1
                    else 
                        #le toca de alternativa, pero, debo ver si es que se puede:
                        count = ValidAlternativeQuestion.joins(:alternative_question).where("usable = ? AND user_id = ? AND alternative_questions.module = ?", true, self.user.id, self.user.module).count
                        if count >= 3
                            new_complexity = 0
                        else
                            new_complexity = 1
                        end
                    end
                else
                    new_complexity = 0
                end

                #analizo la experiencia para ver qué dificultad darle a la tarea hacer:
                if self.user.experience > 6 or self.user.streak >= 3
                    new_difficulty = 2
                elsif (self.user.experience <= 6 and self.user.experience > 3) or self.user.streak == 2
                    new_difficulty = 1
                elsif self.user.experience <= 3
                    new_difficulty = 0
                end

                #creo la tarea
                t = Task.create(module: self.user.module, complexity: new_complexity, difficulty: new_difficulty, number: self.user.task_number)
                UserTask.create(user_id: self.user.id, task_id: t.id)
            end
        end
    end
end
