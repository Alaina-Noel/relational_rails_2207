class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update({
      quantity: params[:quantity],
      gift: params[:gift],
      order_type: params[:order_type],
      })
    redirect_to "/orders/#{@order.id}"
  end

  def destroy
    Order.destroy(params[:id])
    redirect_to '/orders'
  end

end