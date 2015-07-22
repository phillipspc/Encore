Rails.application.routes.draw do
  root to: 'static_pages#root'
  get 'static_pages/home'
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: {format: :json} do
    get "/search", to: "search#search"
    resource :session, only: :show
    resources :artists, only: [:index, :show] do
      resource :artist_tracking, only: [:create, :destroy]
    end
    resources :concerts, only: [:index, :show] do
      resource :concert_tracking, only: [:create, :destroy]
    end
    resources :locales, only: [:index, :show] do
      resource :user_locale, only: [:create, :destroy]
    end
  end

end
