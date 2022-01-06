class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
      :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  # Connections and relationships
  has_many :apartments
  has_many :user_apartments
  has_many :apartments, through: :user_apartments

  has_many :bills

  # has_many :user_bills
  has_many :recipients, class_name: 'UserBill', foreign_key: 'recipient_id'
  has_many :payers, class_name: 'UserBill', foreign_key: 'payer_id'
  has_many :bills, through: :user_bills
end
