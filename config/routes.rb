Weplay::Application.routes.draw do
  get "sessions/create"
  devise_for :users
  resources :users

  get "home/index"
  root 'home#index'
end
