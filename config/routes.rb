Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"
  get "/cars", to: "cars#index"
  get "/dealerships", to: "dealerships#index"
  post "/dealerships", to: "dealerships#create"


  get "/cars/:id", to: "cars#show"
  
  get "/dealerships/new", to: "dealerships#new"

  get "/dealerships/:id", to: "dealerships#show"
  patch "/dealerships/:id", to: "dealerships#update"
  get "/dealerships/:id/edit", to: "dealerships#edit"

  get "/dealerships/:id/cars", to: "dealerships#show_cars"
  

end
