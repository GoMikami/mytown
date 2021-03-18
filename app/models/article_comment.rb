class ArticleComment < ApplicationRecord

belongs_to :contributor
belongs_to :article_comment

end
