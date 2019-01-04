Rails.application.routes.draw do


  root 'welcome#home'


  get '/auth/facebook/callback' => 'sessions#create_physician_fb'
  #get '/auth/facebook/callback' => 'sessions#create'

  get 'patient/signin', to: 'sessions#new_patient'
  post 'patient/signin', to: 'sessions#create_patient'
  get 'physician/signin', to: 'sessions#new_physician'
  post 'physician/signin', to: 'sessions#create_physician'
  get '/logout', to:  'sessions#destroy'




  resources :physicians do
    resources :appointments, only: [:edit, :new, :create, :destroy]
  end
  resources :physician do
    resources :locations, only: [:edit, :new, :create, :destroy]
  end



  resources :patients
  resources :locations , only: [:show]
  resources :appointments, only: [:show]







end
