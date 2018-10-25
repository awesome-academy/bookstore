Rails.application.routes.draw do
  root "books#index"
  mount Ckeditor::Engine => "/ckeditor"
  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :blogs
  resources :books, only: [:index, :show]
  resources :users
  resources :emotions, only: [:destroy, :create]
  resources :authors, only: [:index]
  namespace :admin do
    resources :books
    resources :authors, only: [:index]
  end
end
