require 'test_helper'
require 'helpers/policy_helper'

class MessagePolicyTest < ActiveSupport::TestCase
  include PolicyTestHelpers

  def setup
    create_default_users
    @message = Message.create(message: 'Hi there', user: @test_user)
  end

  def test_show
    assert policy(@test_user, @message).show?
  end

  def test_create
    assert policy(@test_user, @message).create?
  end

  def test_update
    assert policy(@test_user, @message).update?
  end

  def test_destroy
    assert_not policy(@test_user, @message).destroy?
  end
end
