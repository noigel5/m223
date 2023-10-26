require 'test_helper'

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should create session" do
    post user_sessions_url, params: { user: { email: @user.email, password: "123456789012"} }, headers: { "HTTP_AUTHORIZATION" => @authorization }
    assert_response :redirect
    assert_redirected_to root_path
    assert_equal session[:user_id], User.find_by(email: @user.email).id
  end

  test "should destroy session" do
    post user_sessions_url, params: { user: { email: @user.email, password: "123456789012"} }, headers: { "HTTP_AUTHORIZATION" => @authorization }
    assert_response :redirect
    assert_redirected_to root_path
    assert_equal session[:user_id], User.find_by(email: @user.email).id

    delete user_session_url(id: session[:user_id]), headers: { "HTTP_AUTHORIZATION" => @authorization }
    assert_response :redirect
    assert_redirected_to root_path
    assert_nil session[:user_id]
  end
end