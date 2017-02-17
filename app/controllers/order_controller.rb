class OrderController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.product = Product.first
    @order.quantity = 1

    if @order.save
      # TODO
    else
      render action: :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, :customer_mobile, :comment)
  end
end
