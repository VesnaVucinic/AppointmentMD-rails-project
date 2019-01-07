Rails.application.routes.draw do


  root 'welcome#home'


  get '/auth/facebook/callback' => 'sessions#create_physician_fb'
get 'auth/failure' => 'sessions#new_physician'

  get 'patient/signin', to: 'sessions#new'
  post 'patient/signin', to: 'sessions#create'

  get 'physician/signin', to: 'sessions#new'
  post 'physician/signin', to: 'sessions#create'

  delete '/logout', to:  'sessions#destroy'




  resources :physicians do
    resources :appointments
  end
  resources :physician do
    resources :locations
  end

  resources :patient do
    resources :appointments
  end

  resources :patients do
    resources :appointments
end




  resources :physicians
  resources :patients
  resources :locations
  resources :appointments







end
