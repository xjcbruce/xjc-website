class Order < ActiveRecord::Base
  extend Enumerize

  belongs_to :product
  enumerize :status, in: [:waiting, :paid, :confirmed, :done, :cancelled], default: :waiting

  before_create :init_order_uuid, :init_amounts

  def init_order_uuid
    self.order_uuid = "XJCO#{Time.now.strftime("%Y%m%d%H%M%S")}#{SecureRandom.hex(4).upcase}"
  end

  def init_amounts
    self.order_amount = self.product.price * self.quantity
    self.pay_amount = self.order_amount
  end

end
