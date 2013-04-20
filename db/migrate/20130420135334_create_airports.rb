class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.String :name
      t.String :code

      t.timestamps
    end
  end
end
