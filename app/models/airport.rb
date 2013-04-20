class Airport < ActiveRecord::Base
  attr_accessible :code, :name
  
  has_many :arriving_aircraft, class_name: 'Aircraft', foreign_key: 'destination_id'
  has_many :departing_aircraft, class_name: 'Aircraft', foreign_key: 'source_id'
end