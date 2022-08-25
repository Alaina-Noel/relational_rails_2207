Rails.application.routes.draw do

  get '/customers', to: 'customers#index'
  get '/customers/new', to: 'customers#new'
  get '/customers/:id', to: 'customers#show'
  get '/orders', to: 'orders#index'
  get '/orders/:id', to: 'orders#show'
  get '/customers/:id/orders', to: 'customer_orders#index'
  post '/customers', to: 'customers#create'
  

end


