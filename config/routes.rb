Rails.application.routes.draw do

  resources :users


  resources :rides

  resources :attractions

  resources :sessions, only: [:create, :new]
  get '/', to: 'application#index', as: 'root'
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy', as: 'logout'


end
