require 'test_helper'

class ClapControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get clap_create_url
    assert_response :success
  end

end
