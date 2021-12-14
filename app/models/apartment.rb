class Apartment < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  has_many :user_apartments
  has_many :users, through: :user_apartments

  has_many :apartment_bills
  has_many :bills, through: :apartment_bills
end
