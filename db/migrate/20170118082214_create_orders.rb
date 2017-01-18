class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :product
      t.string :order_uuid, null: false, index: true
      t.string :customer_name
      t.string :customer_mobile
      t.string :addr_province
      t.string :addr_city
      t.integer :quantity, default: 0
      t.integer :order_amount, default: 0
      t.integer :pay_amount, default: 0
      t.string :comment
      t.string :status

      t.timestamps null: false
    end
  end
end
