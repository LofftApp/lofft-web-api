class AddApartmentToBills < ActiveRecord::Migration[6.1]
  def change
    add_column :bills, :apartment, :boolean, default: false
  end
end
