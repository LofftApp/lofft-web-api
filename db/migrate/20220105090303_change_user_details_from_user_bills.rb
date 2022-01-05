class ChangeUserDetailsFromUserBills < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_bills, :user_id, :payer_id
    add_reference :user_bills, :recipient, null: true, foreign_key: { to_table: :users }
  end
end
