require "test_helper"

class LocationControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get location_page_url
    assert_response :success
  end
end
