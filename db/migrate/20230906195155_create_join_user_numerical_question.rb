class CreateJoinUserNumericalQuestion < ActiveRecord::Migration[7.0]
  def change
    create_table :join_user_numerical_questions do |t|

      t.timestamps
    end
  end
end
