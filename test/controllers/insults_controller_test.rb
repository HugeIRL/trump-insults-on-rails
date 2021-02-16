require "test_helper"

class InsultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get insults_index_url
    assert_response :success
  end

  test "should get show" do
    get insults_show_url
    assert_response :success
  end
end
