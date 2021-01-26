class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.integer :party_size
      t.string :time
      t.datetime :date
      t.boolean :booked , :default => false
      t.integer :reservation_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
