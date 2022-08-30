Rails.application.routes.draw do

  get '/customers', to: 'customers#index'
  get '/customers/new', to: 'customers#new'
  post '/customers', to: 'customers#create'
  get '/customers/:id', to: 'customers#show'

  get '/orders', to: 'orders#index'
  get '/orders/:id', to: 'orders#show'

  get '/customers/:id/edit', to: 'customers#edit'
  get '/orders/:id/edit', to: 'orders#edit'

  get '/customers/:id/orders', to: 'customer_orders#index'
  get '/customers/:id/orders/new', to: 'customer_orders#new'
  post '/customers/:id/orders', to: 'customer_orders#create' #route designated here & calls customer_orders controller & method create step 2 in the process the backend

  patch '/customers/:id', to: 'customers#update'
  patch '/orders/:id', to: 'orders#update'

  delete '/customers/:id', to: 'customers#destroy'
  delete '/orders/:id', to: 'orders#destroy'
end


