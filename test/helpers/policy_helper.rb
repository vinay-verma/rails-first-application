
module PolicyTestHelpers

  def create_default_users
    @test_user = User.create(username: 'test_user', email: 'admin@test.com', password: 'password', admin: true)
    @test_admin = User.create(username: 'test_admin', email: 'admin@test.com', password: 'password', admin: true)
  end

  def policy(user, record)
    find_policy_class.new(user, record)
  end

  def find_policy_class
    policy_test_class = self.class
    policy_test_class.to_s.split('Test')[0].constantize
  end

end
