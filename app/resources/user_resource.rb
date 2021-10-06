class UserResource < JSONAPI::Resource
  attributes :username, :email, :password, :admin

  has_many :articles

  def fetchable_fields
    super - [:password]
  end
end