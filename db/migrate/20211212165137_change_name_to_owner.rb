class ChangeNameToOwner < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_apartments, "creater", "owner"
  end
end
