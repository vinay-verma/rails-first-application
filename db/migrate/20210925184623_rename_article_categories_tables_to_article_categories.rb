class RenameArticleCategoriesTablesToArticleCategories < ActiveRecord::Migration[6.1]
  def change
    rename_table :article_categories_tables, :article_categories
  end
end
