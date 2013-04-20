class AddAirportIdsToAircraft < ActiveRecord::Migration
  def change
    add_column :aircrafts, :destination_id, :integer
    add_column :aircrafts, :source_id, :integer
  end
end
