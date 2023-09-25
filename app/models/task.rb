class Task < ApplicationRecord
    has_many :join_user_alternative_questions
    has_many :alternative_questions, through: :join_user_alternative_questions

    has_many :join_user_numerical_questions
    has_many :user_tasks

    has_many :error_count_alternatives
    has_many :error_count_numericals

    enum complexity: {
        Compleja: 1,
        Simple: 0
    }
end