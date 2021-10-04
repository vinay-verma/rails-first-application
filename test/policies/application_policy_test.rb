require 'test_helper'
require 'helpers/policy_helper'

class ApplicationPolicyTest < ActiveSupport::TestCase
  include PolicyTestHelpers

  def setup
    create_default_users
    @record = Message.new(message: 'Hi there')
  end

  def test_should_raise_not_authorized_error
    assert_raises(Pundit::NotAuthorizedError) do
      policy(nil, @record).show?
    end
  end

  def test_initialize
    policy(@test_user, @record).show?
  end

end
