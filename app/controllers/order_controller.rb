class OrderController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.product = Product.first
    @order.quantity = 1
    @order.address_code_to_name

    if @order.save
      # TODO
    else
      flash.now[:alert] = "请填写完整信息，以便于我们了解您的需求并能够联系上您，谢谢！"
      render action: :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, :customer_mobile, :comment, :addr_province, :addr_city)
  end
end
