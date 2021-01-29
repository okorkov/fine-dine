class AddReservationIdToSlots < ActiveRecord::Migration[6.1]
  def change
    add_column :slots, :reservation_id, :integer
  end
end
