Rails.application.routes.draw do
  root to: 'static_pages#root'
  get 'static_pages/home'
  get '/auth/twitter/callback', to: 'sessions#twittercreate'

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: {format: :json} do
    get "/search", to: "search#search"
    get "/locale_search", to: "locale_search#locale_search"
    resource :session, only: [:show, :destroy]
    resources :artists, only: [:index, :show, :update] do
      resource :artist_tracking, only: [:create, :destroy]
    end
    resources :concert_photos, only: :create
    resources :concerts, only: [:index, :show, :update] do
      resource :concert_tracking, only: [:create, :destroy]
    end
    resources :locales, only: [:index, :show] do
      resource :user_locale, only: [:create, :destroy]
    end
  end

end
