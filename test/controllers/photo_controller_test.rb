require "test_helper"

class PhotoControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get photo_page_url
    assert_response :success
  end
end
