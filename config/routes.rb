Rails.application.routes.draw do


  root 'welcome#home'
  #get '/auth/facebook/callback' => 'sessions#create'


  get '/signin' =>  'sessions#new'
  post '/signin' =>  'sessions#create'
  get '/logout' => 'sessions#delete'


  resources :patients
  resources :physicians
  resources :locations
  resources :appointments



end
