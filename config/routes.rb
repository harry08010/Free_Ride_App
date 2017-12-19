Rails.application.routes.draw do
  get 'sessions/new'
  get 'welcome/index'
  root 'welcome#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/change_status', to: 'users#change_status'

  get '/chat', to: 'messages#show'
  get '/chat/convs', to: 'messages#show_convs'
  post '/chat/create', to: 'messages#create'
  get '/lock', to: 'ride_posts#lock'
  get 'certificat', to: 'certificate_relationships#certificat'


  resources :users
  resources :ride_posts
  resources :account_activations, only: [:edit]
  resources :account_certifications, only: [:edit]
  resources :approve_relationships, only: [:create, :destroy]
  resources :apply_relationships, only: [:create, :destroy]
  resources :certificate_relationships, only: [:create]
  # post '/messages/create', to: 'messages#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
