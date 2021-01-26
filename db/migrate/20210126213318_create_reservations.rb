class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :guest_id
      t.integer :restaurant_id
      t.datetime :date

      t.timestamps
    end
  end
end
