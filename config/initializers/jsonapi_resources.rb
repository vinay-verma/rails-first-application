JSONAPI.configure do |config|
  config.default_paginator = :paged

  config.default_page_size = 5
  config.maximum_page_size = 100
end