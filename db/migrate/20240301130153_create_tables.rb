class CreateTables < ActiveRecord::Migration[7.1]
  def change
    create_table :tables do |t|
      t.string :table_name
      t.string :seat_number
      t.boolean :is_available

      t.timestamps
    end
  end
end
