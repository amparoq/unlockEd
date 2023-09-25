class ErrorCountAlternative < ApplicationRecord
    belongs_to :user
    belongs_to :alternative_question
    belongs_to :task
end
