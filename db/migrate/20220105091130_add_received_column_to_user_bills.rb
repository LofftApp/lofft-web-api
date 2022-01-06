class AddReceivedColumnToUserBills < ActiveRecord::Migration[6.1]
  def change
    add_column :user_bills, :received, :boolean, default: false
  end
end
