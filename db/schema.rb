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

ActiveRecord::Schema.define(version: 20140320010850) do

  create_table "invoice_addon_line_items", force: true do |t|
    t.integer  "invoice_id"
    t.integer  "package_addon_type_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoice_addon_line_items", ["invoice_id"], name: "index_invoice_addon_line_items_on_invoice_id"
  add_index "invoice_addon_line_items", ["package_addon_type_id"], name: "index_invoice_addon_line_items_on_package_addon_type_id"

  create_table "invoices", force: true do |t|
    t.integer  "sponsor_id"
    t.integer  "package_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["package_type_id"], name: "index_invoices_on_package_type_id"
  add_index "invoices", ["sponsor_id"], name: "index_invoices_on_sponsor_id"

  create_table "package_addon_types", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "total_spots"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_types", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.boolean  "addons_allowed"
    t.integer  "tickets"
    t.integer  "total_spots"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
    t.text     "address"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
