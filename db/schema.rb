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

ActiveRecord::Schema.define(version: 20150708092450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.integer  "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.float    "price"
    t.string   "name"
    t.boolean  "real"
    t.float    "weight"
    t.string   "descriptions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes_count",      default: 0
    t.integer  "category_id"
    t.string   "avatar"
    t.integer  "recommended_item"
  end

  add_index "items", ["name"], name: "index_items_on_name", using: :btree
  add_index "items", ["price"], name: "index_items_on_price", using: :btree

  create_table "order_items", force: true do |t|
    t.integer  "item_id"
    t.integer  "order_id"
    t.integer  "unit_price"
    t.integer  "quantity"
    t.float    "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "total"
    t.integer  "subtotal"
    t.integer  "tax"
    t.integer  "shipping"
    t.integer  "order_status_id"
  end

  create_table "positions", force: true do |t|
    t.integer  "cart_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                 default: "",    null: false
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "encrypted_password",    default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",         default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                 default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
