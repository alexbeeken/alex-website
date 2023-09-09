Rails.application.routes.draw do
  get "rooms/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  resources :rooms do
    resources :messages
  end
  resources :users
  get "/budgets/plaid_signup", to: "budgets#plaid_signup"
  get "/budgets/plaid_success", to: "budgets#plaid_success"
end
