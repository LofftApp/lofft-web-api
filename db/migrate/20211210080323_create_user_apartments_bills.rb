class CreateUserApartmentsBills < ActiveRecord::Migration[6.1]
  def change
    create_table :user_apartments_bills do |t|
      t.references :bill, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.references :apartment, foreign_key: true
      t.boolean :paid
      t.boolean :received

      t.timestamps
    end
  end
end
