Rails.application.routes.draw do
  
  resources :users, only: :index do
    resources :case_assignments 
  end

  resources :case_assignments, only: :create
  resources :cases, only: [:create, :index, :show, :destroy]
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  get '/me', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'
end