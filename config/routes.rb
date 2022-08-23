Rails.application.routes.draw do

  get '/customers', to: 'customers#index'
  get '/customers/:id', to: 'customers#show'
  get '/orders', to: 'orders#index'
  get '/orders/:id', to: 'orders#show'

end


