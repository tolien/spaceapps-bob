require 'test_helper'

class AircraftsControllerTest < ActionController::TestCase
  setup do
    @aircraft = aircrafts(:one)
    @toronto = airports(:yyz)
    @new_york = airports(:jfk)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aircrafts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aircraft" do
    assert_difference('Aircraft.count') do
      post :create, aircraft: { code: @aircraft.code, source_id: @toronto.id, destination_id: @new_york.id }
    end

    assert_redirected_to aircraft_path(assigns(:aircraft))
  end

  test "should show aircraft" do
    get :show, id: @aircraft
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aircraft
    assert_response :success
  end

  test "should update aircraft" do
    put :update, id: @aircraft, aircraft: { code: @aircraft.code, source_id: @toronto.id, destination_id: @new_york.id}
    assert_redirected_to aircraft_path(assigns(:aircraft))
  end

  test "should destroy aircraft" do
    assert_difference('Aircraft.count', -1) do
      delete :destroy, id: @aircraft
    end

    assert_redirected_to aircrafts_path
  end
end
