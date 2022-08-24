class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def all_orders
    @orders_of_parent = Order.where(customer_id: params[:id])
  end

  def count_orders
    #this isn't working as expected
    @order_count = Order.where(customer_id: params[:id]).length
  end
  
end