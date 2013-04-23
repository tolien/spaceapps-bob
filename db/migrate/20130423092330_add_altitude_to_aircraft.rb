class AddAltitudeToAircraft < ActiveRecord::Migration
  def change
    add_column :aircrafts, :altitude, :float
  end
end
