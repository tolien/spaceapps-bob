require 'test_helper'

class AirportsControllerTest < ActionController::TestCase
  setup do
    @airport = airports(:yyz)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:airports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create airport" do
    assert_difference('Airport.count') do
      post :create, airport: { code: @airport.code + "_2", name: @airport.name, latitude: @airport.latitude, longitude: @airport.longitude, capacity: @airport.capacity }
    end

    assert_redirected_to airport_path(assigns(:airport))
  end

  test "should show airport" do
    get :show, id: @airport
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @airport
    assert_response :success
  end

  test "should update airport" do
    put :update, id: @airport, airport: { code: @airport.code + "_2", name: @airport.name, latitude: @airport.latitude, longitude: @airport.longitude }
    assert_redirected_to airport_path(assigns(:airport))
  end

  test "should destroy airport" do
    assert_difference('Airport.count', -1) do
      @airport.arriving_aircraft.destroy_all
      @airport.departing_aircraft.destroy_all
      delete :destroy, id: @airport
    end

    assert_redirected_to airports_path
  end
end
