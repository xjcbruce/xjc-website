require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "order create" do
    before(:each) do
      @product = Product.create!(number: "XJCP001", name: "解决方案", price: 999)
    end

    it "should create an order" do
      order = Order.new(
          customer_name: "Bruce",
          customer_mobile: "13912345678",
          addr_province: "四川",
          addr_city: "成都",
          quantity: 1,
          comment: "测试创建订单",
          product: @product
      )
      order.save

      expect(Order.count).to eq(1)
      expect(Order.first.order_amount).to eq(999)
      expect(Order.first.pay_amount).to eq(999)
      expect(Order.first.status_text).to eq("待支付")
      expect(Order.first.order_uuid).not_to eq(nil)
      printf ">>> new order uuid: #{Order.first.order_uuid}"
    end

  end

end
