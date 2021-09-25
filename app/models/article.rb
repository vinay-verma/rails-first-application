class Article < ApplicationRecord
  belongs_to :user
  has_many :article_category
  has_many :categories, through: :article_category

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 5, maximum: 255 }
end
