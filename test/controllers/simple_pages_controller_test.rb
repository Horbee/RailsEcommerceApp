require 'test_helper'

class SimplePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get simple_pages_index_url
    assert_response :success
  end

  test "should get contact" do
    get simple_pages_contact_url
    assert_response :success
  end

  test "should get about" do
    get simple_pages_about_url
    assert_response :success
  end

end
