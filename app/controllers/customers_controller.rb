class CustomersController < ApplicationController

  def index
    @customers = Customer.all
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


  
end