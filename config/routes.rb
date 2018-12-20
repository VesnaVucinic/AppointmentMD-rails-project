Rails.application.routes.draw do
  get 'locations/new'
  get 'locations/show'
  get 'locations/index'
  get 'locations/destroy'

  get 'appointments/new'
  get 'appointments/show'
  get 'appointments/index'
  get 'appointments/destroy'

  get 'patients/new'
  get 'patients/show'
  get 'patients/index'
  get 'patients/destroy'
  get 'patientss/new'
  get 'patientss/show'
  get 'patientss/index'
  get 'patientss/destroy'
  
  get 'physicians/new'
  get 'physicians/show'
  get 'physicians/index'
  get 'physicians/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
