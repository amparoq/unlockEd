class JoinUserAlternativeQuestion < ApplicationRecord
    belongs_to :task
    belongs_to :alternative_question
end