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

ActiveRecord::Schema.define(version: 20150914221406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["name"], name: "index_accounts_on_name", unique: true, using: :btree

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incoming_messages", force: true do |t|
    t.string   "sender"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "incoming_messages", ["message"], name: "index_incoming_messages_on_message", using: :btree
  add_index "incoming_messages", ["sender"], name: "index_incoming_messages_on_sender", using: :btree

  create_table "main_slides", force: true do |t|
    t.string   "picture"
    t.text     "heading"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "outgoing_messages", force: true do |t|
    t.string   "recipient"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "outgoing_messages", ["message"], name: "index_outgoing_messages_on_message", using: :btree
  add_index "outgoing_messages", ["recipient"], name: "index_outgoing_messages_on_recipient", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "manufacturer"
    t.string   "supplier"
    t.string   "retailer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag"
    t.string   "barcode"
    t.string   "qr_code"
    t.boolean  "confirmed"
    t.integer  "account_id"
    t.integer  "category_id"
  end

  add_index "products", ["account_id"], name: "index_products_on_account_id", using: :btree
  add_index "products", ["barcode"], name: "index_products_on_barcode", unique: true, using: :btree
  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["manufacturer"], name: "index_products_on_manufacturer", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree
  add_index "products", ["qr_code"], name: "index_products_on_qr_code", using: :btree
  add_index "products", ["retailer"], name: "index_products_on_retailer", using: :btree
  add_index "products", ["supplier"], name: "index_products_on_supplier", using: :btree
  add_index "products", ["tag"], name: "index_products_on_tag", unique: true, using: :btree

  create_table "senders", force: true do |t|
    t.string   "phone"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "senders", ["phone"], name: "index_senders_on_phone", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["password_digest"], name: "index_users_on_password_digest", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
