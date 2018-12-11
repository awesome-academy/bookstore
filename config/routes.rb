Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  root "books#index"
  mount Ckeditor::Engine => "/ckeditor"
  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  devise_scope :user do
    get "/signup", to: "devise/registrations#new", as: :signup
  end
  resources :cart_items
  resources :orders
  resources :users do
    resources :favorite_books, only: [:index]
  end
  resources :emotions, only: [:destroy, :create]
  resources :blogs
  resources :books, only: [:index, :show]
  resources :emotions, only: [:destroy, :create]
  resources :authors, only: [:index]
  namespace :admin do
    resources :books
    resources :users, except: [:edit]
    resources :authors, only: [:index]
    resources :xmls, only: [:index]
  end
  resources :books do
    resources :comments
  end

end
