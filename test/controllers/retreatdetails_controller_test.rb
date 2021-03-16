require "test_helper"

class RetreatdetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get retreatdetails_page_url
    assert_response :success
  end
end
