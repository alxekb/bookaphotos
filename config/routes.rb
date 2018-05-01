Rails.application.routes.draw do
  #get "settings/index"

  root to: "home#index"

  resources :photo_sessions do
    get "/:session_date_id/order", to: "photo_sessions#order", as: "order"
  end

  #resources :settings, only: [:index, :create]

  scope module: :profile do
    scope module: :photographer, as: :photographer, path: "photographer" do
      get "/", to: "dashboard#index"
      resources :locations
      resources :photo_sessions
      resources :session_days
      resources :invoices
      resources :clients, as: :clients
      resources :tasks
    end

    scope module: :client, as: :client, path: "profile" do
      get "/", to: "dashboard#index"
      resources :photo_sessions, only: %i[index show]
      resource :settings, only: %i[index update] do
        get "/", to: "settings#index"
      end
    end
  end

  resources :orders

  get "/portfolio(/:theme)", to: "portfolio#index", as: "portfolio"
  get "/about_us", to: "home#about", as: "about"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
