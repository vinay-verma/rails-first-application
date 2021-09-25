ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def mock_admin_user
    User.create(username: 'admin', email: 'admin@test.com', password: 'password', admin: true)
  end

  def log_in_as(user, password = 'password')
    post '/login', params: { session: { username: user.username, password: password } }
  end
end
