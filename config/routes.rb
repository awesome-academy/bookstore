Rails.application.routes.draw do
  root "books#index"
  mount Ckeditor::Engine => "/ckeditor"
  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#about"
  resources :blogs
  resources :books, only: [:index, :show]
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  namespace :admin do
    resources :books
  end
end
