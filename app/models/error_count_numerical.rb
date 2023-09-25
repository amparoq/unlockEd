class ErrorCountNumerical < ApplicationRecord
    belongs_to :user
    belongs_to :numerical_question
    belongs_to :task
end
