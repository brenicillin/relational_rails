Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"
  get "/cars", to: "cars#index"
  post "/cars", to: "dealerships/cars#create"
  get "/cars/:id", to: "cars#show"
  get "/cars/:id/edit", to: "cars#edit"
  patch "/cars/:id", to: "cars#update"
  get "/dealerships", to: "dealerships#index"
  post "/dealerships", to: "dealerships#create"
  get "/dealerships/new", to: "dealerships#new"
  get "/dealerships/:id", to: "dealerships#show"
  patch "/dealerships/:id", to: "dealerships#update"
  get "/dealerships/:id/edit", to: "dealerships#edit"
  get "/dealerships/:id/cars", to: "dealerships/cars#index"
  get "/dealerships/:id/cars/new", to: "dealerships/cars#new"
  post "/dealerships/:id/cars/new", to: "dealerships/cars#create"
  # get "/dealerships/:id/dealerships/:id/cars/new", to: "cars#new"
  # post "/dealerships/5/cars/cars", to: "cars#create"
  
end
