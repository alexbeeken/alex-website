Rails.application.routes.draw do
  get 'rooms/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :rooms do
    resources :messages
  end
  resources :users
  resources :budgets, only: [:index]
end
