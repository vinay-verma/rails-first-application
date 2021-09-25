class Category < ApplicationRecord
  has_many :article_category
  has_many :articles, through: :article_category

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 20 }

end
