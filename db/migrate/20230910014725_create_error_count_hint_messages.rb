class CreateErrorCountHintMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :error_count_alternatives do |t|
      t.integer :error_count, default: -1
      t.boolean :answer_a_show, default: false
      t.boolean :answer_b_show, default: false
      t.boolean :answer_c_show, default: false
    
      t.timestamps
    end
  end
end
