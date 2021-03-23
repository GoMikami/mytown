class ArticleComment < ApplicationRecord

belongs_to :contributor
belongs_to :article

default_scope -> { order(created_at: :desc) }

end