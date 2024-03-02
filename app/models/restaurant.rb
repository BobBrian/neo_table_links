class Restaurant < ApplicationRecord

  belongs_to :user
  has_many :tables, dependent: :destroy
  has_many :reservations

  
end
