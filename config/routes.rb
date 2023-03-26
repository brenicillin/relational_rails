Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/cars', to: 'cars#index'
  get '/cars/:id', to: 'cars#show'

  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/new', to: 'dealerships#new'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/dealerships/:id/cars', to: 'dealerships#show_cars'

  post '/dealerships', to: 'dealerships#create'
end
