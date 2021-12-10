class CreateUserApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_apartments do |t|
      t.belongs_to :user
      t.belongs_to :apartment
      t.boolean :creater, default: false
      t.timestamps
    end
  end
end
