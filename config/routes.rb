Rails.application.routes.draw do
  root 'sessions#index'
  get "dashboard", to: "users#dashboard", as: :dashboard
  resources :users
  resource :session, only: [:new, :create, :destroy, :index]
end
