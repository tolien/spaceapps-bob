require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  setup do
    @yyz = airports(:yyz)
    @jfk = airports(:jfk)
  end
  
  test "airport validation" do
    airport = Airport.create()
    
    assert airport.invalid?
    assert airport.errors[:code].include?("can't be blank")
    assert airport.errors[:name].include?("can't be blank")
    assert airport.errors[:longitude].include?("is not a number")
    assert airport.errors[:latitude].include?("is not a number")
    assert airport.errors[:capacity].include?("is not a number")
    
    airport.code = @yyz.code + "_2"
    airport.name = @yyz.name
    airport.longitude = @yyz.longitude
    airport.latitude = @yyz.latitude
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
    aircraft.latitude = 0
    aircraft.longitude = 0
    aircraft.save!
    
    assert @jfk.arriving_aircraft.count != 0
    assert @yyz.departing_aircraft.count != 0
    assert_no_difference 'Airport.count', "Airports with associated aircraft do not get destroyed" do
      @jfk.destroy
    end    
  end
  
  test "airport capacity validity" do
    airport = @jfk
    assert airport.valid?
    
    airport.capacity = 'cheese'
    assert airport.invalid?
    assert airport.errors[:capacity].include?("is not a number"), "cheese is not a valid number"
    
    airport.capacity = -10
    assert airport.invalid?
    assert airport.errors[:capacity].include?("must be greater than or equal to 0")
    
    airport.capacity = 0
    assert airport.valid?
    
    airport.capacity = 100
    assert airport.valid?
  end
  
  test "airport code must be unique" do
    airport = Airport.new(name: @yyz.name, code: @yyz.code, latitude: @yyz.latitude, longitude: @yyz.longitude)
    assert airport.invalid?, "Airport with the same code as an existing one is invalid"
  end
end
