class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.string :name
      t.text :description
      t.integer :value
      t.string :currency, default: "EUR"
      t.timestamps
    end
  end
end
