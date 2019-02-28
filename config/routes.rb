Rails.application.routes.draw do

  root to: 'tops#index'

  get '/bookmarks', to: 'bookmarks#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users
  resources :bookmarks
end