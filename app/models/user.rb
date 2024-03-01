# Modals are where we make asssociations

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:Customer, :Owner, :Admin]

  has_many :restaurants
  has_many :reservations
  
end
