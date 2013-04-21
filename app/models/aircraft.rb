class Aircraft < ActiveRecord::Base
  attr_accessible :code, :destination_id, :source_id, :latitude, :longitude
  
  belongs_to :destination, class_name: "Airport", foreign_key: "destination_id"
  belongs_to :source, class_name: "Airport", foreign_key: "source_id"
  
  validates_presence_of :code, :destination, :source, :latitude, :longitude
  
  validates_numericality_of :latitude
  validates_numericality_of :longitude
  
  extend FriendlyId
  friendly_id :code, use: :slugged

end