class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :contributor_id
      t.integer :genre_id
      t.integer :postcode
      t.integer :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :title
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
