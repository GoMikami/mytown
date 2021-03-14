Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admin, controllers: {
    sessions:      'admins/sessions',
  }
  devise_for :contributors, controllers: {
    registrations: 'contributors/registrations',
    sessions:      'contributors/sessions'
  }
  
  root "homes#top"
  get "about" => "homes#about"

  resources :contributors
  
  resources :articles
  
  resources :article_comments
  
  resources :genres
  
end
