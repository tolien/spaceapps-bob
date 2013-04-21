class Airport < ActiveRecord::Base
  attr_accessible :code, :name, :latitude, :longitude, :address
  
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
  has_many :arriving_aircraft, class_name: 'Aircraft', foreign_key: 'destination_id'
  has_many :departing_aircraft, class_name: 'Aircraft', foreign_key: 'source_id'
  
  validates_presence_of :code, :name
  validates :code, uniqueness: true
  
  validates_numericality_of :latitude
  validates_numericality_of :longitude
  
  before_destroy :check_no_aircraft_associated
  
  def check_no_aircraft_associated
    (self.arriving_aircraft.size == 0 && self.departing_aircraft.size == 0)
  end
  
end