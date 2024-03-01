class AddRestaurantToTables < ActiveRecord::Migration[7.1]
  def change
    add_reference :tables, :restaurant,foreign_key: true
  end
end
