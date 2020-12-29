Rails.application.routes.draw do
  get 'profiles/index'
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :profiles
end
