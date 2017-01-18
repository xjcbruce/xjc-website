# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170118082214) do

  create_table "orders", force: :cascade do |t|
    t.integer  "product_id",      limit: 4
    t.string   "order_uuid",      limit: 255,             null: false
    t.string   "customer_name",   limit: 255
    t.string   "customer_mobile", limit: 255
    t.string   "addr_province",   limit: 255
    t.string   "addr_city",       limit: 255
    t.integer  "quantity",        limit: 4,   default: 0
    t.integer  "order_amount",    limit: 4,   default: 0
    t.integer  "pay_amount",      limit: 4,   default: 0
    t.string   "comment",         limit: 255
    t.string   "status",          limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "orders", ["order_uuid"], name: "index_orders_on_order_uuid", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "number",      limit: 255,               null: false
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "price",       limit: 4,     default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "products", ["number"], name: "index_products_on_number", using: :btree

end
