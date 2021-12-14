class CreateUserBills < ActiveRecord::Migration[6.1]
  def change
    create_table :user_bills do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bill, null: false, foreign_key: true
      t.boolean :owner, default: false

      t.timestamps
    end
  end
end
