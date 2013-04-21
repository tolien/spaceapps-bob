class AddSlugToAirport < ActiveRecord::Migration
  def change
    add_column :airports, :slug, :string
  end
end
