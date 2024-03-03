class Reservation < ApplicationRecord
  validate :validate_unique_reservation

  belongs_to :user
  belongs_to :restaurant
  belongs_to :table
  
  private

  #Validation Control for Time Limits
  def validate_unique_reservation
    if Reservation.exists?(restaurant_id: restaurant_id, table_id: table_id, reservation_date: reservation_date)
      errors.add(:base, "Another reservation already exists for the same restaurant, table, and time frame")
    end
  end
  
end
