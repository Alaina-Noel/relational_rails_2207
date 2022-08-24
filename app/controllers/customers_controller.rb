class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def all_orders
    # require 'pry' ; binding.pry
    @orders_of_parent = Order.where(customer_id: params[:id])
  end
  
end