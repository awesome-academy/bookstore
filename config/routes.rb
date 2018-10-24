Rails.application.routes.draw do
  root "application#hello"
  get "/signup", to: "users#new"
  resources :users
end
