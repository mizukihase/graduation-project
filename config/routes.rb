Rails.application.routes.draw do
  # Defines the root path route ("/")
  devise_for :users, controllers: { registrations: "users/registrations" }
  # TOPページを top#index に設定
  root "top#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :books, only: [ :index ]
  resources :mangas, only: [ :index ]
  resources :movies, only: [ :index ]
  resources :user_productions, only: [:create, :destroy]
  get '/mangas/:id', to: 'productions#show'
  get '/books/:id', to: 'productions#show'
  get '/movies/:id', to: 'productions#show'
  resources :productions, only: [:show] do
    resources :comments, only: [:create]
  end
  get "recommended_works", to: "works#recommended", as: "recommended_works"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'my_list', to: 'user_productions#index', as: :my_list
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest   
  get '/contact', to: 'static_pages#contact'
  get '/terms',   to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
end
