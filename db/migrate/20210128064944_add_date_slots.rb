class AddDateSlots < ActiveRecord::Migration[6.1]
  def change
    add_column :slots, :date, :string
  end
end
