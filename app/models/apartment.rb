class Apartment < ApplicationRecord
  belongs_to :user
  has_many :users, through: :user_apartments
end
