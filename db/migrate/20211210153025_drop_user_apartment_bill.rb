class DropUserApartmentBill < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_apartments_bills
  end
end
