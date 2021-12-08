class CreateUserAppartmentsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :user_appartments_tables do |t|
      t.references :user, null: false, foreign_key: true
      t.references :appartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
