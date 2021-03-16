Rails.application.routes.draw do
  get 'contributors/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
  }
  
  devise_for :contributor, controllers: {
    registrations: 'contributor/registrations',
    sessions:      'contributor/sessions'
  }
  
  root "homes#top"
  get "homes/about" => "homes#about"
  
  resources :contributors
  
  resources :articles do
    resources :article_comments
  end
  
  resources :genres
  
end
