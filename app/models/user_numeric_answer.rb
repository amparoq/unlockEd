class UserNumericAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :numerical_question
end
