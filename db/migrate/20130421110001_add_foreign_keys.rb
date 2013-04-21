class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key "aircrafts", "airports", :name => "aircrafts_destination_id_fk", :column => "destination_id"
    add_foreign_key "aircrafts", "airports", :name => "aircrafts_source_id_fk", :column => "source_id"
  end
end
