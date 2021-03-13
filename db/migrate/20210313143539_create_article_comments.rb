class CreateArticleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :article_comments do |t|
      t.integer :article_id
      t.string :gender
      t.string :age
      t.string :comment

      t.timestamps
    end
  end
end
