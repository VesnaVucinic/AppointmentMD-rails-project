Rails.application.routes.draw do

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
