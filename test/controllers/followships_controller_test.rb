require 'test_helper'

class FollowshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get followships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get followships_destroy_url
    assert_response :success
  end

end
