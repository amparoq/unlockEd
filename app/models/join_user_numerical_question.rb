class JoinUserNumericalQuestion < ApplicationRecord
    belongs_to :user
    belongs_to :task
    belongs_to :numerical_question
end