Rails.application.routes.draw do


  root 'welcome#home'
  #get '/auth/facebook/callback' => 'sessions#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to:  'sessions#destroy'

  resources :physicians do
    resources :locations, only: [:edit, :new]
  end
  resources :patients
  resources :locations
  resources :appointments



end
