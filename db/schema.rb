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

ActiveRecord::Schema.define(version: 20141009040953) do

  create_table "bids", force: true do |t|
    t.integer  "item_id"
    t.integer  "userId"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "payment_blocked", default: true
  end

  create_table "items", force: true do |t|
    t.integer  "userId"
    t.string   "itemName"
    t.integer  "startPrice"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "winnerId",     default: 0
    t.boolean  "isActive",     default: true
    t.integer  "winningAmt",   default: 0
    t.integer  "lock_version", default: 0
  end

  create_table "users", force: true do |t|
    t.integer  "userId"
    t.integer  "budget",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
