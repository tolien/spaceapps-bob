require 'test_helper'

class AircraftTest < ActiveSupport::TestCase
  setup do
    @one = aircrafts(:one)
  end
  
  test "aircraft validation" do
    aircraft = Aircraft.create
    
    assert aircraft.invalid?
    assert aircraft.errors[:code].include?("can't be blank")
    assert aircraft.errors[:source].include?("can't be blank")
    assert aircraft.errors[:destination].include?("can't be blank")
    assert aircraft.errors[:latitude].include?("can't be blank")
    assert aircraft.errors[:longitude].include?("can't be blank")
    assert aircraft.errors[:altitude].include?("can't be blank")
  end
  
  test "aircraft coordinate validation" do
    aircraft = @one
    aircraft.latitude = 'over'
    aircraft.longitude = 'there'
    assert aircraft.invalid?
    
    assert aircraft.errors[:latitude].include?("is not a number")
    
  end
end
