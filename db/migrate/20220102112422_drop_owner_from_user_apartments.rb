class DropOwnerFromUserApartments < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_apartments, :owner
  end
end
