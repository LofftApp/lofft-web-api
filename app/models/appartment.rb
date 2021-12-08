class Appartment < ApplicationRecord
  belongs_to :user
  has_many :users, through: :user_appartments
end
