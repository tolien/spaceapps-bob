class Aircraft < ActiveRecord::Base
  attr_accessible :code
  
  belongs_to :destination, class_name: "Airport", foreign_key: "destination_id"
  belongs_to :source, class_name: "Airport", foreign_key: "source_id"
end