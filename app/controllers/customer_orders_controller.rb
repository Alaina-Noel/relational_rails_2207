class CustomerOrdersController < ApplicationController 
  
  def index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end
  
  def new
    @customer = Customer.find(params[:id])
  end

  def order_params
    params.permit(:quantity, :gift, :order_type)
  end

  def create
    @customer = Customer.find(params[:id])
    @customer.orders.create(order_params)
    redirect_to "/customers/#{@customer.id}/orders"  
  end

end