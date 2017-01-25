class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :number, null: false, index: true
      t.string :name
      t.text :description
      t.float :price, default: 0.0

      t.timestamps null: false
    end
  end
end
