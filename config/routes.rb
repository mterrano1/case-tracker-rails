Rails.application.routes.draw do
  resources :case_assignments
  resources :cases, only: [:create, :index, :show]
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  get '/me', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'
end