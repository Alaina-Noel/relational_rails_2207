class CustomersController < ApplicationController

  def index
    @customers = Customer.sort_by_most_recent
  end

  def show
    @customer = Customer.find(params[:id])
    @order_count = @customer.orders.count
  end

  def new

  end

  def create
    @customer = Customer.create({
      first_name: params[:customer][:first_name],
      last_name: params[:customer][:last_name],
      in_usa: params[:customer][:in_usa],
      credit_score: params[:customer][:credit_score],
      })
    redirect_to '/customers'
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update({
      first_name: params[:first_name],
      last_name: params[:last_name],
      in_usa: params[:in_usa],
      credit_score: params[:credit_score],
      })
    redirect_to "/customers/#{@customer.id}"
  end

  def destroy
    orders = Order.where(customer_id: params[:id])
    customer = Customer.find(params[:id])
    orders.destroy_all
    customer.destroy
    redirect_to '/customers'
  end
  
end