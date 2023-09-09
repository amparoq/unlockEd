class UserQuestionValue < ApplicationRecord
    belongs_to :user
    belongs_to :numerical_question
end
