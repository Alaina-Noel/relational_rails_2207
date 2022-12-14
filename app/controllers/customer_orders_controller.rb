class CustomerOrdersController < ApplicationController 
  
  def index
    @customer = Customer.find(params[:id])
    @orders = if params[:sort_by] == 'order_type'
      @customer.orders.order(:order_type)
    elsif params[:commit] == "Only return orders with more than this number of quantity"
      specificied_quantity = params[:number]
      @customer.orders.find_orders_above(specificied_quantity)
    else
      @customer.orders
    end
  end
  
  def new
    @customer = Customer.find(params[:id])
  end

  def create
    #step 3 in the process - the back end
    @customer = Customer.find(params[:id])
    @customer.orders.create!(order_params)
    #step 4 directing the user to a diff page
    redirect_to "/customers/#{@customer.id}/orders"  
  end

  private
  def order_params
    params.permit(:quantity, :gift, :order_type)
  end

end