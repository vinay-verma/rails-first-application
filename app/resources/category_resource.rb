class CategoryResource < JSONAPI::Resource
  attributes :name

  has_many :articles

  exclude_links [:self]
end