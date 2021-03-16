require "test_helper"

class AmenitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get amenities_page_url
    assert_response :success
  end
end
