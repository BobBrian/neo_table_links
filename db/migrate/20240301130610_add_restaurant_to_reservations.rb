class AddRestaurantToReservations < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :restaurant, foreign_key: true
  end
end
