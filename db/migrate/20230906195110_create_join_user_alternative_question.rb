class CreateJoinUserAlternativeQuestion < ActiveRecord::Migration[7.0]
  def change
    create_table :join_user_alternative_questions do |t|
      t.integer :order_number

      t.timestamps
    end
  end
end
