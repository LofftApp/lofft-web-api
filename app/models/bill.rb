class Bill < ApplicationRecord
  belongs_to :user
  has_many :users, through: :user_apartments_bills
  has_many :apartments, through: :user_apartments_bills
end
