Rails.application.routes.draw do
  #root 'pages#index' # Defina a página inicial do seu projeto

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :edit, :update]
  get "up" => "rails/health#show", as: :rails_health_check
end
