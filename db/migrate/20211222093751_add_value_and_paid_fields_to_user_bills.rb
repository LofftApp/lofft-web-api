class AddValueAndPaidFieldsToUserBills < ActiveRecord::Migration[6.1]
  def change
    add_column :user_bills, :value, :float
    add_column :user_bills, :currency, :string, default: 'EUR'
    add_column :user_bills, :paid, :boolean, default: false
    add_column :user_bills, :accepted, :boolean, default: false
  end
end
