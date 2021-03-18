require "test_helper"

class MyFormControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_form_index_url
    assert_response :success
  end
end
