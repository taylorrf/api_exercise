require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: @user.name } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end
end
