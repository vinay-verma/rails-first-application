require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @admin_user = mock_admin_user
  end

  test 'should_handle_unauthorised_user' do
    get messages_url
    assert_redirected_to login_url
  end

  def test_index
    log_in_as(@admin_user, 'password')
    get messages_url
    assert_response :success
  end

  def test_create
    log_in_as(@admin_user, 'password')
    assert_difference('Message.count', 1) do
      post messages_path, params: { message: 'Hello there' }
    end
    assert_redirected_to messages_url
  end

end
