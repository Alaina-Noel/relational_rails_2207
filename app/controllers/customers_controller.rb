class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @order_count = @customer.orders.count
  end
  
end