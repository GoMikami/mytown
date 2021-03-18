class AddContributorIdToArticleComments < ActiveRecord::Migration[5.2]
  def change
    add_column :article_comments, :contributor_id, :integer
  end
end
