Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
#admin側 
  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  
  namespace :admin do
    resources :genres
    resources :contributors do
      member do
        get 'index', to: 'contributors#index'
        get 'show', to: 'contributors#show'
        get 'edit', to: 'contributors#edit'
        patch 'update', to: 'contributors#pudate'
      end
    end
  end

# contributor側
  devise_for :contributor, controllers: {
    registrations: 'contributor/registrations',
    sessions:      'contributor/sessions'
  }
  
  root "homes#top"
  get "homes/about" => "homes#about"
  
  resources :contributors
  
  resources :articles do
    resources :article_comments, only: [:create, :destroy]
  end
  
  resources :genres
  
end