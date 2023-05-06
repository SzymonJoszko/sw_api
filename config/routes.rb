Rails.application.routes.draw do
  resources :vehicles
  resources :starships
  resources :species
  resources :planets
  resources :people
  resources :films
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
