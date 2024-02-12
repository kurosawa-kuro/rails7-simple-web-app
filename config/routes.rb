Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show, :new, :create]
  resources :todos, only: [:index, :show, :new, :create]
  resources :categories, only: [:index, :show, :new, :create]

end
