require "test_helper"

class Public::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get public_search_search_url
    assert_response :success
  end
end
