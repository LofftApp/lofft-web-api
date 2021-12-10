class Apartment < ApplicationRecord
  has_many :user_apartments
  has_many :users, through: :user_apartments
end
