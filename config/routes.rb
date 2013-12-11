Weplay::Application.routes.draw do
  resources :events

  get "sessions/create"
  devise_for :users
  resources :users
  resources :games

  get "home/index"
  root 'home#index'
end
