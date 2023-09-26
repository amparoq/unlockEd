class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_questions
  has_many :user_question_values
  has_many :error_count_numericals
  has_many :error_count_alternatives
  has_many :user_tasks
  has_many :valid_alternative_questions

  enum role: {
    teacher: 1,
    student: 0
  }

  after_create :assign_valid_alternatives
  after_create :handle_assignment
  before_save :change_user_level

  private

  def handle_assignment 
    t = Task.create(complexity: 0, module: 0, number: self.task_number)
    UserTask.create(user_id: self.id, task_id: t.id)
    t2 = Task.create(complexity: 1, module: 0, difficulty: 0, number: self.task_number + 1)
    UserTask.create(user_id: self.id, task_id: t2.id)
  end

  def assign_valid_alternatives
    all_alternative_q = AlternativeQuestion.all
    all_alternative_q.each do |aid|
      ValidAlternativeQuestion.create(user_id: self.id, alternative_question_id: aid.id)
    end
  end

  def change_user_level
    total = self.error_count_alternatives.where(error_count: [0,1,2
    ]).count + self.error_count_numericals.where(error_count: [0,1,2
    ]).count
    self.user_level = (self.good_questions.to_f / total.to_f) * 9.0 + 1.0
  end

end
