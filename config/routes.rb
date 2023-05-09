Rails.application.routes.draw do
  resources :vehicles, only: %i[show]
  resources :starships, only: %i[show]
  resources :species, only: %i[show]
  resources :planets, only: %i[show]
  resources :people, only: %i[show index]
  resources :films, only: %i[show index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
