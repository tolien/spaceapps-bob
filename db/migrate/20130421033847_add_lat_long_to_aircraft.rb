class AddLatLongToAircraft < ActiveRecord::Migration
  def change
    add_column :aircrafts, :latitude, :float, :default => 0
    add_column :aircrafts, :longitude, :float, :default => 0
  end
end

  