Rails.application.routes.draw do
  get 'users', to: 'users#index'
  get 'user', to: 'users#show'
  get 'users/:id', to: 'users#show'
  get 'users/:id/edit', to: 'users#edit'

  root to: 'tops#index'
  get 'signup', to:'users#new'
  resource :users
end
