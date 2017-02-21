class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :gb_code, null: false, index: true
      t.string :name, null: false
      t.integer :level, null: false, limit: 1, default: 0
      t.string :father_gb_code
      t.boolean :visible, null: false, default: true

      t.timestamps
    end
  end
end
