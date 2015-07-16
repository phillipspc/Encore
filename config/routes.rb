Rails.application.routes.draw do
  root to: 'static_pages#root'
  resources :users
  resource :session

  namespace :api, defaults: {format: :json} do
    resource :session
    resources :artists do
      resource :artist_tracking
    end
  end

end
