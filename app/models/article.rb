class Article < ApplicationRecord

 belongs_to :contributor
 attachment :image
 
end
