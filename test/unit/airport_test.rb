require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  setup do
    @yyz = airports(:yyz)
  end
  
  test "airport coordinate validity" do
    airport = @yyz
    assert airport.valid?, "Airport is valid with lat/long set"
    
    airport.latitude = nil
    airport.longitude = @yyz.longitude
    assert airport.invalid?, "Airport is invalid with no latitude"
    
    airport.latitude = @yyz.latitude
    airport.longitude = nil
    assert airport.invalid?, "Airport is invalid with no longitude"
    
    airport.latitude = nil
    airport.longitude = nil
    assert airport.invalid?, "Airport is invalid with no lat/long set"
  end
end
