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

ActiveRecord::Schema.define(version: 20150616223450) do

  create_table "bid_offers", force: true do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "userSent"
    t.integer  "userReceive"
    t.string   "message"
    t.datetime "createdAt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", force: true do |t|
    t.integer  "user_id"
    t.string   "event_name"
    t.date     "event_date"
    t.text     "event_description"
    t.boolean  "is_active"
    t.float    "starting_price"
    t.float    "actual_price"
    t.datetime "expire_date"
    t.boolean  "is_auction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isApproved"
  end

  create_table "pila_packs", force: true do |t|
    t.string   "name"
    t.float    "real_value"
    t.float    "pila_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", force: true do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.float    "paid_value"
    t.boolean  "is_cancelled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "user_id"
    t.string   "event_name"
    t.date     "event_date"
    t.text     "event_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.float    "price"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.float    "balance",                default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isModerator"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
