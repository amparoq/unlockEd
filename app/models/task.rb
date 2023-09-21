class Task < ApplicationRecord
    has_many :join_user_alternative_questions
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