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

  private

  def handle_assignment 
    t = Task.create(complexity: 0, module: 0)
    UserTask.create(user_id: self.id, task_id: t.id)
  end

  def assign_valid_alternatives
    all_alternative_q = AlternativeQuestion.all
    all_alternative_q.each do |aid|
      ValidAlternativeQuestion.create(user_id: self.id, alternative_question_id: aid.id)
    end
  end

end
