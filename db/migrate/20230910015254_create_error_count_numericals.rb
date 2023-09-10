class CreateErrorCountNumericals < ActiveRecord::Migration[7.0]
  def change
    create_table :error_count_numericals do |t|
      t.integer :error_count, default: -1
      t.boolean :hint_show, default: false
      
      t.timestamps
    end
  end
end
