Rails.application.routes.draw do
  root to: 'static#home'
  get 'static/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
