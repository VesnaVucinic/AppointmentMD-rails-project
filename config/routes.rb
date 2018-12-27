Rails.application.routes.draw do


  root 'welcome#home'
  #get '/auth/facebook/callback' => 'sessions#create'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get '/signin' =>  'sessions#new'
  post '/signin' =>  'sessions#create'
  delete '/logout' =>  'sessions#destroy'


  resources :physicians
  resources :patients
  resources :appointments
  resources :locations
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
