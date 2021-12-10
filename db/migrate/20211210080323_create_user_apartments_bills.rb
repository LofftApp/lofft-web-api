class CreateUserApartmentsBills < ActiveRecord::Migration[6.1]
  def change
    create_table :user_apartments_bills do |t|
      t.references :bill, null: false, foreign_key: true
      t.references :user_owner, null: false, foreign_key: {to_table: :users}
      t.references :user_payer, null: false, foreign_key: {to_table: :users}
      t.boolean :paid
      t.boolean :received

      t.timestamps
    end
  end
end
