require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  setup do
    @yyz = airports(:yyz)
  end
  
  test "airport coordinate validity" do
    airport = @yyz
    airport.latitude = nil
    airport.longitude = nil
    
    assert airport.invalid?
  end
end
