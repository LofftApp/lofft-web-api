class Apartment < ApplicationRecord
  belongs_to :user
  has_many :users, through: :user_apartments
  has_many :bills, through: :user_apartments_bills
end
