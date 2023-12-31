Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'pages#home'
  resources :dashboard
  resources :categories
  resources :products
  get '/profile', to: 'profile#index'
  get '/set_theme', to: 'theme#update'
  get '/set_sidebar', to: 'theme#sidebar'
end
