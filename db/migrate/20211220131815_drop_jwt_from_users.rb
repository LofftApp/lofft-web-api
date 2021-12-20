class DropJwtFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :jti
  end
end
