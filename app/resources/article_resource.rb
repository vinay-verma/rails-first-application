class ArticleResource < JSONAPI::Resource
  attributes :title, :description

  has_many :categories, exclude_links: :default, always_include_linkage_data: true
  has_one :user, exclude_links: :default, always_include_linkage_data: true

  exclude_links :default
end