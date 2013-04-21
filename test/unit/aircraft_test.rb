require 'test_helper'

class AircraftTest < ActiveSupport::TestCase
  test "aircraft validation" do
    aircraft = Aircraft.create
    
    assert aircraft.invalid?
    assert aircraft.errors[:code].include?("can't be blank")
    assert aircraft.errors[:source].include?("can't be blank")
    assert aircraft.errors[:destination].include?("can't be blank")
    assert aircraft.errors[:latitude].include?("can't be blank")
    assert aircraft.errors[:longitude].include?("can't be blank")
    
    aircraft.latitude = 'over'
    aircraft.longitude = 'there'
    assert aircraft.invalid?
    
    assert aircraft.errors[:latitude].include?("is not a number")
    
  end
end
