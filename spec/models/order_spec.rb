require 'rails_helper'

# About Transaction, read:
# https://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/transactions

RSpec.describe Order, type: :model do

  describe "订单操作" do
    before(:all) do
      @product = Product.create!(number: "XJCP001", name: "解决方案", price: 999)
    end

    after(:all) do
      @product.destroy!
    end

    before(:each) do
      @product.reload

      @order = Order.create!(
          customer_name: "Bruce",
          customer_mobile: "13912345678",
          addr_province: "四川",
          addr_city: "成都",
          quantity: 1,
          comment: "测试创建订单",
          product: @product
      )
    end

    it "应该创建一个订单" do
      expect(Order.count).to eq(1)
      expect(@order).to eq(Order.first)
      expect(@order.order_amount).to eq(@product.price)
      expect(@order.pay_amount).to eq(@product.price)
      expect(@order.status_text).to eq("待支付")
      expect(@order.order_uuid).not_to eq(nil)
      printf ">>> new order uuid: #{Order.first.order_uuid}"

      expect(OrderHistory.count).to eq(1)
      order_history = @order.order_histories.first
      expect(order_history).to eq(OrderHistory.first)
      expect(order_history.operation_text).to eq("创建订单")
      expect(order_history.operator).to eq(@order.customer_name)
      expect(order_history.comment).to eq(@order.order_uuid)
    end

    it "应该取消一个订单" do
      expect(@order.cancel).to eq(true)
      expect(@order.status).to eq(:cancelled)
      expect(@order.order_histories.count).to eq(2)
      expect(OrderHistory.count).to eq(2)
    end

  end

end
