Rails.application.routes.draw do
  #root 'pages#index' # Defina a página inicial do seu projeto

#   get '/login', to: 'sessions#new'
#   post '/login', to: 'sessions#create'
#   delete '/logout', to: 'sessions#destroy'
#
#   resources :users, only: [:new, :create, :edit, :update]
#   get "up" => "rails/health#show", as: :rails_health_check

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :logos, only: [:create]
  resources :banners, only: [:create]

  resources :users, only: [:create, :update]
  get '/users/me', to: 'users#me'
  get '/dashboard', to: 'dashboard#index'
end
