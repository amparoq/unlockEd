class AlternativeQuestion < ApplicationRecord
    has_many :join_user_alternative_questions
    has_many :valid_alternative_questions

    enum difficulty: {
        high: 2,
        medium: 1,
        low: 0
    }
end