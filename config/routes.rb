Rails.application.routes.draw do

  devise_for :users
  resources :articles

  root to: 'articles#index'
end
