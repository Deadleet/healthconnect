require "test_helper"

class MeasuresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get measures_show_url
    assert_response :success
  end

  test "should get new" do
    get measures_new_url
    assert_response :success
  end

  test "should get edit" do
    get measures_edit_url
    assert_response :success
  end
end
