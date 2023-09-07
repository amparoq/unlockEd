class Task < ApplicationRecord
    belongs_to :user
    has_many :join_user_alternative_questions

    enum status: {
        completed: 2,
        skipped: 1,
        pending: 0
    }
end