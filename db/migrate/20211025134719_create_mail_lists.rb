class CreateMailLists < ActiveRecord::Migration[6.1]
  def change
    create_table :mail_lists do |t|
      t.string :email
      t.boolean :verified

      t.timestamps
    end
  end
end
