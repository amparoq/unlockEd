class Task < ApplicationRecord
    belongs_to :user

    enum status: {
        completed: 2,
        skipped: 1,
        pending: 0
    }
end