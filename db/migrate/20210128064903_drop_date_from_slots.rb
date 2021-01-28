class DropDateFromSlots < ActiveRecord::Migration[6.1]
  def change
    remove_column :slots, :date
  end
end
