Rails.application.routes.draw do


  root 'welcome#home'
  #get '/auth/facebook/callback' => 'sessions#create'


  get '/signin' =>  'sessions#new'
  post '/signin' => 'sessions#new'
  get '/signin' =>  'sessions#create'
  delete '/logout' => 'sessions#delete'


  resources :patients
  resources :physicians
  resources :locations
  resources :appointments







    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
