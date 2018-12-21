Rails.application.routes.draw do

  get '/auth/facebook/callback' => 'sessions#create'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'welcome#home'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  resources :physicians, only: [:new, :create, :show, :destroy]
  resources :patients, only: [:new, :create, :show, :destroy]
  resources :appointments, only: [:new, :create, :show, :edit]
  resources :locations, only: [:new, :create, :show, :edit, :destroy]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
