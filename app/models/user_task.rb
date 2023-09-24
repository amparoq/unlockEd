class UserTask < ApplicationRecord
    belongs_to :user
    belongs_to :task

    enum status: {
        completed: 2,
        skipped: 1,
        pending: 0
    }
end
