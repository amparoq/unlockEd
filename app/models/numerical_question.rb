class NumericalQuestion < ApplicationRecord
    has_many :join_user_numerical_questions

    enum difficulty: {
        high: 2,
        medium: 1,
        low: 0
    }
end