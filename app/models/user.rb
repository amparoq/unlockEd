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

  after_save :handle_assignment

  private

  def handle_assignment 
    task_1 = Task.find_by(number: 1)
    UserTask.create(user_id: self.id, task_id: task_1.id)
    alternatives_joined = task_1.join_user_alternative_questions
    alternatives = []
    alternatives_joined.each do |al|
        alternatives << al.alternative_question
    end 
    alternatives.each do |alter|
      entry1 = ErrorCountAlternative.create(user_id: self.id, alternative_question_id: alter.id)
      entry1.save
    end
    task_2 = Task.find_by(number: 2)
    numerical_question = task_2.join_user_numerical_questions.first.numerical_question
    entry2 = ErrorCountNumerical.create(user_id: self.id, numerical_question_id: numerical_question.id)
    entry2.save
    task_3 = Task.find_by(number: 3)
    UserTask.create(user_id: self.id, task_id: task_3.id)
    alternatives_joined = task_3.join_user_alternative_questions
    alternatives = []
    alternatives_joined.each do |al|
        alternatives << al.alternative_question
    end 
    alternatives.each do |alter|
      entry3 = ErrorCountAlternative.create(user_id: self.id, alternative_question_id: alter.id)
      entry3.save
    end
    task_4 = Task.find_by(number: 4)
    numerical_question = task_4.join_user_numerical_questions.first.numerical_question
    entry4 = ErrorCountNumerical.create(user_id: self.id, numerical_question_id: numerical_question.id)
    entry4.save
  end
end
