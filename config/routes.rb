Rails.application.routes.draw do
  root 'sessions#new'
  resources :users
  resource :session, only: [:new, :create, :destroy]
end
