class Table < ApplicationRecord

  belongs_to :restaurant
  has_many :reservations, dependent: :destroy
  attribute :is_available, :boolean, default: true

  
end
