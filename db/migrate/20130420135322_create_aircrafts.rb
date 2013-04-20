class CreateAircrafts < ActiveRecord::Migration
  def change
    create_table :aircrafts do |t|
      t.String :code

      t.timestamps
    end
  end
end
