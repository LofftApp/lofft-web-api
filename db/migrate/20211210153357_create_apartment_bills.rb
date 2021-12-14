class CreateApartmentBills < ActiveRecord::Migration[6.1]
  def change
    create_table :apartment_bills do |t|
      t.references :apartment, null: false, foreign_key: true
      t.references :bill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
