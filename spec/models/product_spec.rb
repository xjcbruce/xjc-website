require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'should create a product' do
    product = Product.new(number: "XJCP001", name: "解决方案")
    product.save
    expect(Product.count).to eq(1)
    expect(Product.first.price).to eq(0)
  end

end

