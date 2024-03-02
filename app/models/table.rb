class Table < ApplicationRecord

  belongs_to :restaurant
  has_many :reservations
  attribute :is_available, :boolean, default: true

  
end
