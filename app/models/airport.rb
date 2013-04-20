class Airport < ActiveRecord::Base
  attr_accessible :code, :name, :latitude, :longitude
  
  has_many :arriving_aircraft, class_name: 'Aircraft', foreign_key: 'destination_id'
  has_many :departing_aircraft, class_name: 'Aircraft', foreign_key: 'source_id'
  
  validates_presence_of :code, :name
  
  validates_numericality_of :latitude
  validates_numericality_of :longitude
  
end