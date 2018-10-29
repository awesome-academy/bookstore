Rails.application.routes.draw do
  root "books#index"
  mount Ckeditor::Engine => "/ckeditor"
  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    member do
      get "/favorite_books", to:"users#favorite"
    end
  end
  resources :emotions, only: [:destroy, :create]
  resources :blogs
  resources :books, only: [:index, :show]
  resources :emotions, only: [:destroy, :create]
  resources :authors, only: [:index]
  namespace :admin do
    resources :books
  end
end
