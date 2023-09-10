class AddUserReffToErrorCountHinMessage < ActiveRecord::Migration[7.0]
  def change
    add_reference :error_count_alternatives, :user, null: false, foreign_key: true
  end
end
