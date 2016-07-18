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

ActiveRecord::Schema.define(version: 20160718200853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "unit_price"
    t.integer  "items_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "invoice_id"
    t.index ["items_id"], name: "index_invoice_items_on_items_id", using: :btree
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "status"
    t.integer  "customers_id"
    t.integer  "merchants_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["customers_id"], name: "index_invoices_on_customers_id", using: :btree
    t.index ["merchants_id"], name: "index_invoices_on_merchants_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "merchants_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "unit_price"
    t.index ["merchants_id"], name: "index_items_on_merchants_id", using: :btree
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "credit_card_number"
    t.datetime "credit_card_expiration_date"
    t.string   "result"
    t.integer  "invoices_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["invoices_id"], name: "index_transactions_on_invoices_id", using: :btree
  end

  add_foreign_key "invoice_items", "items", column: "items_id"
  add_foreign_key "invoices", "customers", column: "customers_id"
  add_foreign_key "invoices", "merchants", column: "merchants_id"
  add_foreign_key "items", "merchants", column: "merchants_id"
  add_foreign_key "transactions", "invoices", column: "invoices_id"
end
