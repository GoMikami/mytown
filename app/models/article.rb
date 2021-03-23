class Article < ApplicationRecord

 belongs_to :contributor
 attachment :image
 has_many :article_comments, dependent: :destroy
 
 default_scope -> { order(created_at: :desc) }
 
end
