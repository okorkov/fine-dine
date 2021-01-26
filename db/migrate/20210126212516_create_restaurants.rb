class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :email
      t.string :password_digest
      t.string :password_confirmation
      t.string :opening_time
      t.string :closing_time
      t.integer :city_id
      t.string :phone_number
      t.string :address
      t.string :picture
      t.integer :capacity

      t.timestamps
    end
  end
end
