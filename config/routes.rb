Rails.application.routes.draw do

  root to: "home#index"

  resources :photo_sessions do
    get "/:session_date_id/order", to: "photo_sessions#order", as: "order"
  end

  scope module: :profile do
    scope module: :photographer, as: :photographer, path: "photographer" do
      get "/", to: "dashboard#index"
      resources :locations
      resources :photo_sessions
      resources :session_days
      resources :invoices
      resources :clients, as: :clients
      resources :tasks, except: %i[new edit update destroy create] do
        collection do
          patch :start_editing
          patch :finish_editing
          patch :start_sorting
          patch :finish_sorting
          patch :start_processing
          patch :finish_processing
          patch :send_photos
          patch :client_receive
          patch :client_review
          patch :client_add_service
          patch :closing_order
          patch :archiving_order
        end
      end
      get "dropbox/auth" => "dropbox#auth", as: :dropbox_auth
      get "dropbox/auth_callback" => "dropbox#auth_callback", as: :dropbox_callback
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
  resources :charges

  get "/portfolio(/:theme)", to: "portfolio#index", as: "portfolio"
  get "/about_us", to: "home#about", as: "about"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
