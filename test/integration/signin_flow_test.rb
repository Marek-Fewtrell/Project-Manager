require 'test_helper'

class SigninFlowTest < ActionDispatch::IntegrationTest

  test "can see the signin page" do
    get "/"
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Log in"
  end

  test "incorrect login" do
    get "/login"
    assert_response :success

    post "/login", session: { email: "incorect@email.com", password: "incorrect" }
    assert_response :success
    assert_select "span", "Email or password was incorrect"
  end

  test "correct signin" do
    get "/login"
    assert_response :success

    post "/login", session: { email: "bob@email.com", password: "bob" }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h2", "Projects"
  end

end
