require "test_helper"

class FollowUpsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get follow_ups_index_url
    assert_response :success
  end

  test "should get show" do
    get follow_ups_show_url
    assert_response :success
  end

  test "should get new" do
    get follow_ups_new_url
    assert_response :success
  end

  test "should get edit" do
    get follow_ups_edit_url
    assert_response :success
  end
end
