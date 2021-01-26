class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests do |t|
      t.string :email
      t.string :password_digest
      t.string :password_confirmation
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.string :avatar

      t.timestamps
    end
  end
end
