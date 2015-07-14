Rails.application.routes.draw do
  root to: 'users#dashboard'
  get 'users/dashboard', to: 'users#dashboard'
  resources :users
  resource :session
end
