class AddPictureToCitiesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :cities, :picture, :string
  end
end
