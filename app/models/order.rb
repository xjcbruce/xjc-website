class Order < ActiveRecord::Base
  extend Enumerize

  enumerize :status, in: [:waiting, :paid, :confirmed, :done, :cancelled], default: :waiting

  belongs_to :product
  has_many :order_histories, inverse_of: :order

  before_create :init_order_uuid, :init_amounts

  def init_order_uuid
    self.order_uuid = "XJCO#{Time.now.strftime("%Y%m%d%H%M%S")}#{SecureRandom.hex(4).upcase}"
  end

  def init_amounts
    self.order_amount = self.product.price * self.quantity
    self.pay_amount = self.order_amount
  end

  after_create :add_create_history

  def add_create_history
    self.order_histories.create(operation: :create_order, operator: self.customer_name, comment: self.order_uuid)
  end

  ### business logic

  def cancel(operator = "system")
    self.status = :cancelled
    cancel_history = self.order_histories.build(operation: :cancel_order, operator: operator, comment: self.order_uuid)

    if self.save
      cancel_history.save
      true
    else
      logger.info("取消订单失败: 订单号=#{order_uuid}, ID=#{id}, 操作者=#{operator}")
      false
    end
  end

end
