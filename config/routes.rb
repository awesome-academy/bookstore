Rails.application.routes.draw do
  root "static_pages#home"
  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#about"
  resources :blogs, only: [:index, :show]
  resources :books, only: [:index, :show]
end
