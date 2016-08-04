class CreateJoinTableArticlesCategories < ActiveRecord::Migration
  def change
    create_join_table :articles, :categories do |t|
      t.index [:article_id, :category_id]
      t.index [:category_id, :article_id]
    end
  end
end
