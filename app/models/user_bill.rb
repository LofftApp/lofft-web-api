class UserBill < ApplicationRecord
  # named_scope :users, {include: [:recipient, :payer]}
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'
  belongs_to :payer, class_name: 'User', foreign_key: 'payer_id'
  belongs_to :bill
end
