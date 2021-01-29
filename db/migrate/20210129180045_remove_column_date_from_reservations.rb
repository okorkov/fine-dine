class RemoveColumnDateFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :date
  end
end
