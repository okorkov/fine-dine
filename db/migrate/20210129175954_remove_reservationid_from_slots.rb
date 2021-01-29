class RemoveReservationidFromSlots < ActiveRecord::Migration[6.1]
  def change
    remove_column :slots, :reservation_id
  end
end
