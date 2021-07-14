Rails.application.routes.draw do
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'books#index'
  resources :books, only: %i[index create update destroy]

  post '/sign-up', to: 'users#sign-up'
  post '/login', to: 'users#login'
end
