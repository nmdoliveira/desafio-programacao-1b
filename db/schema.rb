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

ActiveRecord::Schema.define(version: 20170520230022) do

  create_table "imports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_imports", force: :cascade do |t|
    t.integer "order_id"
    t.integer "import_id"
  end

  add_index "order_imports", ["import_id"], name: "index_order_imports_on_import_id"
  add_index "order_imports", ["order_id"], name: "index_order_imports_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.string   "client"
    t.string   "description"
    t.integer  "unit_price"
    t.integer  "amount"
    t.string   "address"
    t.string   "supplier"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
