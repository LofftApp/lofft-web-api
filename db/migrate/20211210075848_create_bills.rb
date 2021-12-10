class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :value
      t.string :currency
      t.timestamps
    end
  end
end
