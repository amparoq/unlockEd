class AddUserReffToValidAlternativeQuestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :valid_alternative_questions, :user, null: false, foreign_key: true
  end
end
