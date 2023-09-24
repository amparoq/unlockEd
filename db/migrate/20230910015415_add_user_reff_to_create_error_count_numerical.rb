class AddUserReffToCreateErrorCountNumerical < ActiveRecord::Migration[7.0]
  def change
    add_reference :error_count_numericals, :user, null: false, foreign_key: true
    add_reference :error_count_numericals, :task, null: false, foreign_key: true
  end
end
