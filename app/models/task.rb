class Task < ApplicationRecord
    has_many :join_user_alternative_questions
    has_many :alternative_questions, through: :join_user_alternative_questions
    accepts_nested_attributes_for :alternative_questions, allow_destroy: true
    
    has_many :join_user_numerical_questions
    has_many :user_tasks

    enum status: {
        completed: 2,
        skipped: 1,
        pending: 0
    }

    enum complexity: {
        Compleja: 1,
        Simple: 0
    }
end