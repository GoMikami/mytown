Rails.application.routes.draw do
  get 'article_comments/new'
  get 'article_comments/index'
  get 'article_comments/show'
  get 'article_comments/create'
  get 'article_comments/edit'
  get 'article_comments/update'
  get 'article_comments/destroy'
  get 'articles/new'
  get 'articles/index'
  get 'articles/show'
  get 'articles/create'
  get 'articles/edit'
  get 'articles/update'
  get 'articles/destroy'
  get 'genres/create'
  get 'genres/edit'
  get 'genres/update'
  get 'genres/index'
  devise_for :admins
  devise_for :contributors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
