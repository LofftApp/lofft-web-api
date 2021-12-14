class ChangeIntToFloatInBills < ActiveRecord::Migration[6.1]
  def change
    change_column :bills, :value, :float
  end
end
