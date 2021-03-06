class Bill < ApplicationRecord
  belongs_to :user
  has_many :user_bills
  has_many :users, through: :user_bills

  has_many :apartment_bills
  has_many :apartments, through: :apartment_bills
end
