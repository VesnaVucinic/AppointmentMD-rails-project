Rails.application.routes.draw do


  root 'welcome#home'
  #get '/auth/facebook/callback' => 'sessions#create'

  get 'patient/signin', to: 'sessions#new_patient'
  post 'patient/signin', to: 'sessions#create_patient'
  get 'physician/signin', to: 'sessions#new_physician'
  post 'physician/signin', to: 'sessions#create_physician'
  get '/logout', to:  'sessions#destroy'


  resources :physicians
  resources :patients
  resources :locations
  resources :appointments



end
