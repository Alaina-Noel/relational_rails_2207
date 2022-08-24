class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @order_count = @customer.orders.count
  end

  def all_orders
    @orders_of_parent = Order.where(customer_id: params[:id])
  end
  
end