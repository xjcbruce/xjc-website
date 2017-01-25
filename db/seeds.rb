# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# active admin init user
AdminUser.delete_all
AdminUser.create!(email: 'y@xinjiechang.com', password: 'password', password_confirmation: 'password')

# products
Product.delete_all
Product.create!(number: "XJCP010", name: "解决方案", description: "互联网及信息系统解决方案", price: 99)
Product.create!(number: "XJCP020", name: "产品设计", description: "互联网及信息系统产品设计", price: 99)
Product.create!(number: "XJCP030", name: "系统研发", description: "互联网及信息系统系统研发", price: 1)
