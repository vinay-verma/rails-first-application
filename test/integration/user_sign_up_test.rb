require "test_helper"

class UserSignUpTest < ActionDispatch::IntegrationTest

  test 'sign up user and log in automatically and logout' do
    get '/signup'
    assert_response :success
    assert_difference 'User.count', 1 do
      post '/users', params: { user: { username: 'test', email: 'test@test.com', password: 'password' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'test\'s profile', response.body
  end

end
