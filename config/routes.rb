Rails.application.routes.draw do
  # Defines the root path route ("/")
  devise_for :users, controllers: { registrations: "users/registrations" }
  # TOPページを top#index に設定
  root "top#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :books, only: [ :index ]
  resources :mangas, only: [ :index ]
  resources :movies, only: [ :index ]
  get "recommended_works", to: "works#recommended", as: "recommended_works"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
