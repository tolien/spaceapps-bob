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
  
  test "can't delete an airport with associated aircraft" do
    aircraft = aircrafts(:one)
    aircraft.source = @yyz
    aircraft.destination = @jfk
    aircraft.save!
    
    assert @jfk.arriving_aircraft.count != 0
    assert @yyz.departing_aircraft.count != 0
    assert_no_difference 'Airport.count', "Airports with associated aircraft do not get destroyed" do
      @jfk.destroy
    end
    
  end
  
  test "airport code must be unique" do
    airport = Airport.new(name: @yyz.name, code: @yyz.code, latitude: @yyz.latitude, longitude: @yyz.longitude)
    assert airport.invalid?, "Airport with the same code as an existing one is invalid"
  end
end
