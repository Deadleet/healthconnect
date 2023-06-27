require "test_helper"

class PathologiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pathologies_index_url
    assert_response :success
  end

  test "should get show" do
    get pathologies_show_url
    assert_response :success
  end

  test "should get new" do
    get pathologies_new_url
    assert_response :success
  end

  test "should get edit" do
    get pathologies_edit_url
    assert_response :success
  end
end
