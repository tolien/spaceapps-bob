class AddLatLongToAircraft < ActiveRecord::Migration
  def change
    add_column :aircrafts, :latitude, :float
    add_column :aircrafts, :longitude, :float
  end
end

  