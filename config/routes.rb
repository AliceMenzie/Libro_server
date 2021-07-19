Rails.application.routes.draw do
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "books#index"
  get "/books/history", to: "books#history"
  resources :books
  # get '/wishlist', to: 'books#wishlist'
  get "/books/wishlist", to: "books#wishlist"
  post "/sign-up", to: "users#sign_up"
  post "/login", to: "users#login"
end
