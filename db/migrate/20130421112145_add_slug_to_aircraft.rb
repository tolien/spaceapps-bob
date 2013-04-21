class AddSlugToAircraft < ActiveRecord::Migration
  def change
    add_column :aircrafts, :slug, :string
  end
end
