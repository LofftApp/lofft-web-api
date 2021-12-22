class RemoveOwnerFromUserBills < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_bills, :owner
  end
end
