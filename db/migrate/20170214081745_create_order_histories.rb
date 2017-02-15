class CreateOrderHistories < ActiveRecord::Migration
  def change
    create_table :order_histories do |t|
      t.references :order
      t.string :operation, null: false
      t.string :operator
      t.string :comment

      t.timestamps null: false
    end
  end
end
