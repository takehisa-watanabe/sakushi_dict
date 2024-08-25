Rails.application.routes.draw do

  root to: 'toppage#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "test" =>"test#test"

  post "words", to: "tangotyou#index"
 
  get "words" => "tangotyou#index"

  #post "kanren", to: "tangotyou#kanren"

  post "shinki", to: "tangotyou#shinki"

  post "henkou", to: "tangotyou#henkou"

  post "kanrentouroku", to: "tangotyou#kanrentouroku"



  delete "words", to: "tangotyou#destroy"

  


  # Defines the root path route ("/")
  # root "posts#index"
end
