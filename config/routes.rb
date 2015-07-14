Rails.application.routes.draw do
  root 'sessions#index'
  resources :users
  resource :session, only: [:new, :create, :destroy, :index]
end
