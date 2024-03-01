class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.string :reservation_name
      t.datetime :reservation_date
      t.boolean :is_active

      t.timestamps
    end
  end
end
