class OrderHistory < ActiveRecord::Base
  extend Enumerize

  enumerize :operation,
            in: [
                :create_order, # 创建订单
                :start_pay, # 发起支付
                :pay_success, # 支付返回且成功
                :pay_failed, # 支付返回但支付失败
                :cancel_order # 取消订单
                ]

  belongs_to :order, inverse_of: :order_histories

end
