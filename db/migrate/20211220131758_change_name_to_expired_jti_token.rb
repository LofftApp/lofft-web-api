class ChangeNameToExpiredJtiToken < ActiveRecord::Migration[6.1]
  def change
    rename_column :jwt_denylist, "exp", "expired_at"
  end
end
