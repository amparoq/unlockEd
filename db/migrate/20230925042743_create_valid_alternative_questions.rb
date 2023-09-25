class CreateValidAlternativeQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :valid_alternative_questions do |t|
      t.boolean :usable, default: true

      t.timestamps
    end
  end
end
