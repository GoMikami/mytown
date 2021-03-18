class Article < ApplicationRecord

 belongs_to :contributor
 attachment :image
 has_many :article_comment, dependent: :destroy
 
end
