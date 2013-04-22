class AddAirportCapacityToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :capacity, :integer
  end
end
