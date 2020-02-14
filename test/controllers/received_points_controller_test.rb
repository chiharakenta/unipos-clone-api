require 'test_helper'

class ReceivedPointsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get received_points_create_url
    assert_response :success
  end

  test "should get update" do
    get received_points_update_url
    assert_response :success
  end

end
